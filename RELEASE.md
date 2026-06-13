<div align="center">

# Release Policy

**Versioning and release automation for dsatechzone-solutions-hub**

[![Organization](https://img.shields.io/badge/org-dsatechzone--solutions--hub-1f6feb?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dsatechzone-solutions-hub)
[![semantic-release](https://img.shields.io/badge/semantic--release-automated-494382?style=for-the-badge&logo=semanticrelease)](https://github.com/semantic-release/semantic-release)
[![SemVer](https://img.shields.io/badge/versioning-SemVer-7c3aed?style=for-the-badge)](https://semver.org/)
[![Conventional Commits](https://img.shields.io/badge/commits-Conventional-FE5196?style=for-the-badge&logo=conventionalcommits&logoColor=white)](https://www.conventionalcommits.org/)

[![Standards Hub](https://img.shields.io/badge/Standards-.github%20repo-24292f?style=flat-square&logo=github)](https://github.com/dsatechzone-solutions-hub/.github)
[![Contributing](https://img.shields.io/badge/Contributing-guide-1f883d?style=flat-square)](CONTRIBUTING.md)
[![Workflow Template](https://img.shields.io/badge/workflow-Semantic%20Release-2088FF?style=flat-square&logo=githubactions&logoColor=white)](workflow-templates/semantic-release.yml)
[![Config Template](https://img.shields.io/badge/config-.releaserc.json-000000?style=flat-square&logo=json)](templates/releaserc.json)

</div>

---

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

| Commit | Release | Badge |
|--------|---------|-------|
| `fix:` | PATCH | ![patch](https://img.shields.io/badge/semver-PATCH-0ea5e9?style=flat-square) |
| `feat:` | MINOR | ![minor](https://img.shields.io/badge/semver-MINOR-8b5cf6?style=flat-square) |
| `BREAKING CHANGE:` or `feat!:` / `fix!:` | MAJOR | ![major](https://img.shields.io/badge/semver-MAJOR-ef4444?style=flat-square) |
| `docs:`, `chore:`, `ci:`, `refactor:`, `test:` | No release | ![none](https://img.shields.io/badge/release-none-lightgrey?style=flat-square) |

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

[![Continuous delivery](https://img.shields.io/badge/infra-continuous%20delivery-f97316?style=flat-square&logo=kubernetes&logoColor=white)](#infrastructure-repositories)

Infra and operations repos (e.g. `scaleway-home-lab`) use **continuous delivery**, not semver tags:

- Merge to `main` is the release mechanism (deploy scripts, runbooks, GitOps).
- No `vX.Y.Z` tags required.
- Use the org **Infra CI** workflow (shellcheck, yamllint, kubeconform).
- Document verification in PRs and runbooks instead of CHANGELOG entries.

## Branch policy

- Releases are cut from `main` only (configured in `.releaserc.json`).
- Use short-lived feature branches; squash merge to `main` with conventional commit messages.

---

<div align="center">

[![Infra CI](https://img.shields.io/badge/infra%20repos-Infra%20CI-2088FF?style=flat-square&logo=githubactions&logoColor=white)](workflow-templates/infra-ci.yml)
[![No semver for infra](https://img.shields.io/badge/infra-no%20semver%20tags-lightgrey?style=flat-square)](#infrastructure-repositories)

</div>
