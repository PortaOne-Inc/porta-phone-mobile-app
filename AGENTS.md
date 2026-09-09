# AGENTS.md

The PortaPhone mobile application, the call plugin it runs on, and the tooling
that brands it - one repository, four directories. Each was a repository of its
own until the move to Gerrit, and each keeps the instructions it came with.

| Directory     | What it is                                              | Instructions                             |
|---------------|---------------------------------------------------------|------------------------------------------|
| `phone/`      | The Flutter application                                  | [phone/AGENTS.md](phone/AGENTS.md)       |
| `callkeep/`   | The call plugin: platform interface, Android, iOS        | [callkeep/AGENTS.md](callkeep/AGENTS.md) |
| `phone_tools/`| The CLI that configures and builds a brand               | [phone_tools/AGENTS.md](phone_tools/AGENTS.md) |
| `analysis/`   | The lint rules the other three include                   | `analysis/README.md`                     |

Work inside the package a change belongs to. Its instructions load when you read
files there, so this page carries only what is true for all of them.

## Git

The repository is served by Gerrit rather than GitHub: a change is one commit, a
correction is a new patchset of that same commit, and there are no pull requests.

- Subject: `WT-1234 Capitalised summary`, 50 characters or fewer, no full stop.
  Body wrapped at 72, saying why rather than how.
- `Change-Id` comes from Gerrit's own `commit-msg` hook. A commit without one is
  refused on push.
- `git wip` pushes for review and keeps the change private until it is ready;
  `git review` publishes it. A correction is `git commit --amend`, never a second
  commit.
- Never amend or force-push a commit that has been merged.

The full rules, and the department page behind them, are in
[phone/CONTRIBUTING.md](phone/CONTRIBUTING.md).

## Hooks

Two sets, both configured here and nowhere below:

- `lefthook.yml` - formats on commit, checks subjects and runs analyze and tests
  on push, scoped to the packages a change touches. `lefthook install` once.
- `.claude/` - settings, plus hooks that format a file after it is written and
  refuse access to secrets.

Both used to live inside the packages, where nothing read them once those
packages became subtrees of this repository.

## Standards that hold everywhere

- English only in source, comments, logs and commit messages. No Cyrillic.
- No agent attribution: no `Co-Authored-By` lines, no "generated with" notes.
- Never edit generated files (`*.g.dart`, `*.freezed.dart`, `*.pigeon.dart`) -
  regenerate them.
