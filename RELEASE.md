# Release policy

This document defines how releases are managed across dsatechzone-solutions-hub repositories.

## Versioned repositories (applications, libraries, packages)

Versioned repos use **[semantic-release](https://github.com/semantic-release/semantic-release)** to automate SemVer, changelogs, and GitHub Releases from [Conventional Commits](https://www.conventionalcommits.org/).

### Setup

1. Copy [`templates/releaserc.json`](templates/releaserc.json) to the repository root as `.releaserc.json`.
2. Copy [`templates/package.json`](templates/package.json) to the repository root and run `npm install`.
3. Add the org **Semantic Release** workflow from **Actions → New workflow → Organization workflows**.

### Trigger

On every push to `main`, semantic-release:

1. Analyzes commits since the last release tag.
2. Determines the next SemVer version.
3. Updates `CHANGELOG.md`.
4. Creates a Git tag `vX.Y.Z`.
5. Publishes a GitHub Release with generated notes.

### Version mapping

| Commit | Release |
|--------|---------|
| `fix:` | PATCH |
| `feat:` | MINOR |
| `BREAKING CHANGE:` footer or `feat!:` / `fix!:` | MAJOR |
| `docs:`, `chore:`, `ci:`, `refactor:`, `test:` | No release (unless breaking) |

The org `.releaserc.json` template uses the **`conventionalcommits`** preset so `feat!:` and `fix!:` breaking markers are recognized.

### Permissions

The semantic-release workflow job requires:

- `contents: write`
- `issues: write`
- `pull-requests: write`

See the [official GitHub Actions recipe](https://semantic-release.gitbook.io/semantic-release/recipes/ci-configurations/github-actions).

### Optional plugins

Add `@semantic-release/npm` only in repos that publish to npm. Add container or other publish plugins per repository — not in the org default.

## Infrastructure repositories

Infra and operations repos (e.g. `scaleway-home-lab`) use **continuous delivery**, not semver tags:

- Merge to `main` is the release mechanism (deploy scripts, runbooks, GitOps).
- No `vX.Y.Z` tags required.
- Use the org **Infra CI** workflow (shellcheck, yamllint, kubeconform).
- Document verification in PRs and runbooks instead of CHANGELOG entries.

## Branch policy

- Releases are cut from `main` only (configured in `.releaserc.json`).
- Use short-lived feature branches; squash merge to `main` with conventional commit messages.
