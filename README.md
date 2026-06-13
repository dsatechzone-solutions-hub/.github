<div align="center">

# dsatechzone-solutions-hub

**Organization-wide GitHub defaults — standards, templates, and workflow starters**

[![Organization](https://img.shields.io/badge/org-dsatechzone--solutions--hub-1f6feb?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dsatechzone-solutions-hub)
[![Repository](https://img.shields.io/badge/repo-.github-24292f?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dsatechzone-solutions-hub/.github)
[![Visibility](https://img.shields.io/badge/visibility-public-success?style=for-the-badge)](https://github.com/dsatechzone-solutions-hub/.github)
[![Templates](https://img.shields.io/badge/issue%20forms-7-blue?style=for-the-badge)](.github/ISSUE_TEMPLATE/)
[![Workflows](https://img.shields.io/badge/org%20workflows-5-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)](workflow-templates/)

[![Contributing](https://img.shields.io/badge/Contributing-guide-1f883d?style=flat-square)](CONTRIBUTING.md)
[![Release](https://img.shields.io/badge/Release-semantic--release-494382?style=flat-square&logo=npm)](RELEASE.md)
[![Security](https://img.shields.io/badge/Security-policy-critical?style=flat-square&logo=shield)](SECURITY.md)
[![Code of Conduct](https://img.shields.io/badge/Code%20of%20Conduct-Contributor%20Covenant-4baaaa?style=flat-square)](CODE_OF_CONDUCT.md)
[![Support](https://img.shields.io/badge/Support-help-0969da?style=flat-square)](SUPPORT.md)
[![Governance](https://img.shields.io/badge/Governance-org%20rules-8250df?style=flat-square)](docs/ORG_GOVERNANCE.md)

</div>

---

This repository provides **organization-wide defaults** for all repositories under [dsatechzone-solutions-hub](https://github.com/dsatechzone-solutions-hub).

GitHub automatically applies these files to member repos that do not define their own version of the same file. See [Creating a default community health file](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file).

> **Note:** This repository must remain **public** so org-wide issue templates, PR templates, and community health files propagate to member repositories.

## Repository map

| Path | Purpose |
|------|---------|
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | Engineering standards (TDD, commits, reviews) |
| [`RELEASE.md`](RELEASE.md) | semantic-release policy for versioned repos |
| [`SECURITY.md`](SECURITY.md) | Vulnerability reporting |
| [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) | Community standards |
| [`SUPPORT.md`](SUPPORT.md) | Where to get help |
| [`CODEOWNERS.example`](CODEOWNERS.example) | Copy to `.github/CODEOWNERS` in member repos |
| [`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE/) | Default issue forms |
| [`.github/pull_request_template.md`](.github/pull_request_template.md) | Default PR checklist |
| [`workflow-templates/`](workflow-templates/) | Reusable GitHub Actions starters |
| [`templates/`](templates/) | `.releaserc.json` and minimal `package.json` for semantic-release |
| [`scripts/sync-labels.sh`](scripts/sync-labels.sh) | Reproducible label bootstrap |
| [`docs/ORG_GOVERNANCE.md`](docs/ORG_GOVERNANCE.md) | Branch protection and adoption guide |

## Week 1 adoption checklist

### Every new repository

1. Copy [`CODEOWNERS.example`](CODEOWNERS.example) → `.github/CODEOWNERS` and customize paths.
2. Run `./scripts/sync-labels.sh --repo dsatechzone-solutions-hub/YOUR-REPO`.
3. Add workflow(s) from **Actions → New workflow → Organization workflows**:
   - All repos: **Secret Scan**
   - App/library repos: **CI Pipeline**, **PR Hygiene**, **Semantic Release**
   - Infra/shell/K8s repos: **Infra CI**
4. Enable branch protection on `main` per [`docs/ORG_GOVERNANCE.md`](docs/ORG_GOVERNANCE.md).

### Versioned repos (apps, libraries)

1. Copy [`templates/releaserc.json`](templates/releaserc.json) → `.releaserc.json`
2. Copy [`templates/package.json`](templates/package.json) → `package.json`, run `npm install`
3. Adopt **Semantic Release** org workflow; ensure commits follow [Conventional Commits](https://www.conventionalcommits.org/)

### Infra repos (e.g. scaleway-home-lab)

1. Adopt **Infra CI** (shellcheck, yamllint, kubeconform)
2. Do **not** use semantic-release — see [`RELEASE.md`](RELEASE.md)

## Override behavior

- If a member repo adds **any** file under its own `.github/ISSUE_TEMPLATE/`, org issue templates are **not** used for that repo.
- Repo-local `CONTRIBUTING.md`, `SECURITY.md`, etc. override org defaults.

---

<div align="center">

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-FE5196?style=flat-square&logo=conventionalcommits&logoColor=white)](https://www.conventionalcommits.org/)
[![semantic-release](https://img.shields.io/badge/semantic--release-automated-494382?style=flat-square&logo=semanticrelease)](https://github.com/semantic-release/semantic-release)
[![TDD](https://img.shields.io/badge/engineering-TDD--first-0ea5e9?style=flat-square)](CONTRIBUTING.md)

</div>
