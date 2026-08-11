// Pipeline for Devel/webtrit/core-build on jenkins.int.portaone.com (REL-5036).
//
// Builds the WebTrit core (SaaS) image from the core/ subtree of porta-phone/backend and
// archives it as a build artefact. It does not publish: pushing to Harbor is a separate,
// explicitly agreed step.
//
// Job parameters:
//   SRC_REF      - mandatory. Branch, tag or commit of porta-phone/backend to build.
//                  A core/vX.Y.Z tag produces the release image :X.Y.Z and is verified
//                  against @version in core/mix.exs; any other ref produces
//                  <mix version>-<short sha>. Default master.
//   PIPELINE_REF - optional. Which version of this pipeline the job runs: an exact ref
//                  such as refs/heads/master, refs/tags/<tag>, a Gerrit patchset ref
//                  refs/changes/NN/CCCCCC/P, or a commit id. The job derives its fetch
//                  refspec from this value, so a change to the pipeline can be tried
//                  before it is merged. Default refs/heads/master.

pipeline {
  agent { label 'centos-lxc-ci-2' }

  options {
    buildDiscarder(logRotator(daysToKeepStr: '14'))
    disableConcurrentBuilds()
  }

  environment {
    IMAGE       = 'registry.portaone.com/webtrit/webtrit_core'
    BACKEND_URL = 'ssh://jenkins@git.portaone.com:29418/porta-phone/backend.git'
    DOCKER_CONFIG = "${WORKSPACE}/.docker"
  }

  stages {

    stage('Checkout') {
      steps {
        script {
          env.SRC = (params.SRC_REF ?: 'master').trim()
          if (!env.SRC) { error('SRC_REF must not be empty') }
        }
        // changelog: false - the git plugin computes it with 'git whatchanged', which the
        // agent's git refuses to run (deprecated); it only produced a stack trace per build.
        checkout(changelog: false, poll: false, scm: [$class: 'GitSCM',
                  branches: [[name: env.SRC]],
                  userRemoteConfigs: [[url: env.BACKEND_URL,
                                       refspec: '+refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*']]])
        sh 'git --no-pager log -1 --oneline'
      }
    }

    stage('Resolve version') {
      steps {
        script {
          def mixVersion = sh(returnStdout: true,
                              script: "sed -n 's/^[[:space:]]*@version \"\\(.*\\)\"/\\1/p' core/mix.exs | head -1").trim()
          def sha = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
          if (!mixVersion) { error('Could not read @version from core/mix.exs') }

          if (env.SRC.startsWith('core/v')) {
            def tagVersion = env.SRC.substring('core/v'.length())
            if (tagVersion != mixVersion) {
              error("Tag ${env.SRC} disagrees with @version ${mixVersion} in core/mix.exs")
            }
            env.VERSION = tagVersion
            env.RELEASE = 'true'
          } else {
            // Not a release tag: build a clearly non-release image so it can never
            // be mistaken for, or overwrite, a published version.
            env.VERSION = "${mixVersion}-${sha}"
            env.RELEASE = 'false'
          }
          currentBuild.description = "${env.SRC} -> ${env.IMAGE}:${env.VERSION}"
          echo "Building ${env.IMAGE}:${env.VERSION} (release=${env.RELEASE})"
        }
      }
    }

    stage('Docker preflight') {
      steps {
        sh 'docker version && docker info --format "server={{.ServerVersion}} driver={{.Driver}} root={{.DockerRootDir}}"'
      }
    }

    stage('Build image') {
      steps {
        sh '''set -eu
          # Base images are date-pinned (ubuntu:jammy-20240227,
          # hexpm/elixir:1.16.2-erlang-26.2.4-ubuntu-jammy-20240227), so re-pulling them
          # every build only burns Docker Hub's anonymous rate limit for no benefit.
          docker build -f core/Dockerfile core/ \
            -t "$IMAGE:$VERSION" \
            --label GIT_REVISION="$(git rev-parse HEAD)" \
            --label GIT_COMMIT_DATE="$(git show -s --format=%ci HEAD)"
          docker image inspect "$IMAGE:$VERSION" --format 'image={{.Id}} size={{.Size}} created={{.Created}}'
        '''
      }
    }

    stage('Export image') {
      steps {
        // The image is this job's only output - it is not pushed anywhere, so it has to
        // leave the agent as a build artefact or the run produces nothing.
        sh '''set -eu
          rm -f webtrit_core-*.tar.gz
          docker save "$IMAGE:$VERSION" | gzip -1 > "webtrit_core-$VERSION.tar.gz"
          ls -l "webtrit_core-$VERSION.tar.gz"
        '''
        archiveArtifacts artifacts: 'webtrit_core-*.tar.gz', fingerprint: true, onlyIfSuccessful: true
      }
    }

  }

  post {
    always {
      // The artefact has been archived by now; drop the local tag so the shared agent
      // does not accumulate one image per build.
      sh 'docker rmi "$IMAGE:$VERSION" || true'
      cleanWs()
    }
  }
}
