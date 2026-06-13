<div align="center">

# Organization Governance

**Branch protection, reviews, releases, and workflow adoption**

[![Organization](https://img.shields.io/badge/org-dsatechzone--solutions--hub-1f6feb?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dsatechzone-solutions-hub)
[![Branch Protection](https://img.shields.io/badge/main-protected-success?style=for-the-badge&logo=git)](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)
[![CODEOWNERS](https://img.shields.io/badge/CODEOWNERS-required-1f883d?style=for-the-badge)](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
[![Dependabot](https://img.shields.io/badge/Dependabot-security%20updates-0366d6?style=for-the-badge&logo=dependabot&logoColor=white)](https://docs.github.com/en/code-security/dependabot)

[![Standards Hub](https://img.shields.io/badge/Standards-.github%20repo-24292f?style=flat-square&logo=github)](https://github.com/dsatechzone-solutions-hub/.github)
[![Contributing](https://img.shields.io/badge/Contributing-guide-1f883d?style=flat-square)](../CONTRIBUTING.md)
[![Release Policy](https://img.shields.io/badge/Release-semantic--release-494382?style=flat-square)](../RELEASE.md)
[![Security](https://img.shields.io/badge/Security-policy-critical?style=flat-square&logo=shield)](../SECURITY.md)

</div>

---

Recommended policies for dsatechzone-solutions-hub. Configure in **GitHub → Organization settings → Rules → Rulesets** and per-repository branch protection.

## Branch protection (`main`)

| Policy | Recommendation |
|--------|----------------|
| Default branch | `main` |
| Force push | Disabled |
| Deletion | Disabled |
| Linear history | Squash merge preferred |
| Required reviews | ≥1 approval; ≥2 for infra or security-sensitive repos |
| Dismiss stale reviews | Enabled |
| Require conversation resolution | Enabled |

## Required status checks

| Repo type | Required checks |
|-----------|-----------------|
| Application / library | ![CI](https://img.shields.io/badge/check-CI%20Pipeline-2088FF?style=flat-square&logo=githubactions&logoColor=white) ![Secrets](https://img.shields.io/badge/check-Secret%20Scan-critical?style=flat-square&logo=shield) |
| Infrastructure / ops | ![Infra](https://img.shields.io/badge/check-Infra%20CI-326ce5?style=flat-square&logo=kubernetes&logoColor=white) ![Secrets](https://img.shields.io/badge/check-Secret%20Scan-critical?style=flat-square&logo=shield) |

Configure checks after workflows are adopted and have run at least once (GitHub lists check names from workflow runs).

## CODEOWNERS adoption

1. Copy [`CODEOWNERS.example`](../CODEOWNERS.example) to `.github/CODEOWNERS` in each member repo.
2. Customize path ownership beyond the default `@dipakkumarsingh-dsatechzone`.
3. Enable **Require review from Code Owners** in branch protection for repos using CODEOWNERS.

## Release rules

| Repo type | Release mechanism |
|-----------|-------------------|
| Versioned (apps, libraries) | [![semantic-release](https://img.shields.io/badge/release-semantic--release-494382?style=flat-square&logo=semanticrelease)](../RELEASE.md) on push to `main` |
| Infrastructure (e.g. scaleway-home-lab) | [![CD](https://img.shields.io/badge/release-continuous%20delivery-f97316?style=flat-square)](../RELEASE.md) — no semver tags |

Versioned repos must:

- Copy [`templates/releaserc.json`](../templates/releaserc.json) → `.releaserc.json`
- Copy [`templates/package.json`](../templates/package.json) → `package.json`
- Adopt the org **Semantic Release** workflow starter

## Labels

Bootstrap labels in new repos:

```bash
git clone https://github.com/dsatechzone-solutions-hub/.github
./.github/scripts/sync-labels.sh --repo dsatechzone-solutions-hub/YOUR-REPO
```

Issue templates reference labels that must exist in each repository.

## Signed commits

Encourage signed commits org-wide. Require for production-facing repositories when team key management is in place.

## Dependabot

- Enable **Dependabot security updates** on all repositories.
- Enable version updates per repository based on dependency volume.

## Workflow starters

Adopt from **Actions → New workflow → Organization workflows**:

| Starter | Badge | Use when |
|---------|-------|----------|
| CI Pipeline | ![CI](https://img.shields.io/badge/CI%20Pipeline-2088FF?style=flat-square&logo=githubactions&logoColor=white) | Application or library with custom lint/test/build steps |
| Infra CI | ![Infra CI](https://img.shields.io/badge/Infra%20CI-326ce5?style=flat-square&logo=kubernetes&logoColor=white) | Bash, YAML, Kubernetes manifest repos |
| Secret Scan | ![Secret Scan](https://img.shields.io/badge/Secret%20Scan-critical?style=flat-square&logo=shield) | All repositories |
| PR Hygiene | ![PR Hygiene](https://img.shields.io/badge/PR%20Hygiene-1f883d?style=flat-square) | Repos using Conventional Commits for PR titles |
| Semantic Release | ![Semantic Release](https://img.shields.io/badge/Semantic%20Release-494382?style=flat-square&logo=semanticrelease) | Versioned repos only |

## Security reporting

Exploitable vulnerabilities: email **dipak-kumar.singh@dsatechzone.com** per [SECURITY.md](../SECURITY.md). Do not use public issues.

## Override behavior

Member repos can override org defaults by adding local files (e.g. `.github/ISSUE_TEMPLATE/` replaces all org issue templates for that repo). Document overrides in the repository README.

---

<div align="center">

[![Contributing](https://img.shields.io/badge/read-Contributing%20guide-1f883d?style=flat-square)](../CONTRIBUTING.md)
[![Support](https://img.shields.io/badge/read-Support-0969da?style=flat-square)](../SUPPORT.md)

</div>
