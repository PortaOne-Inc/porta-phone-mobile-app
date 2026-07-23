# Git Standards & Workflow

## 1. Branch Naming

**Pattern:** `^(feature|refactor|fix|chore|build|style|docs|release)/.+$`

* **Allowed:** `feature/add-artifact-upload`, `fix/auth-leak`.

## 2. Commit Messages (Conventional Commits)

**Pattern:** `^(feat|fix|chore|refactor|test|docs|style|ci|perf|build|revert)(\(.+\))?:\ .+`

* **Rules:** * No Cyrillic.
    * Must use lower case for the type.
    * Example: `feat(themes): implement color scheme generator`.

## 3. Pre-Submission

* Validate that no Cyrillic characters exist in the diff.
* Ensure `npm run lint` passes before suggesting code.
