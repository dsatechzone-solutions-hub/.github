# Organization governance

Recommended policies for dsatechzone-solutions-hub. Configure in **GitHub → Organization settings → Rules → Rulesets** and per-repository branch protection.

## Branch protection (main)

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
| Application / library | CI Pipeline, Secret Scan (PR Hygiene optional) |
| Infrastructure / ops | Infra CI, Secret Scan |

Configure checks after workflows are adopted and have run at least once (GitHub lists check names from workflow runs).

## CODEOWNERS adoption

1. Copy [`CODEOWNERS.example`](../CODEOWNERS.example) to `.github/CODEOWNERS` in each member repo.
2. Customize path ownership beyond the default `@dipakkumarsingh-dsatechzone`.
3. Enable **Require review from Code Owners** in branch protection for repos using CODEOWNERS.

## Release rules

| Repo type | Release mechanism |
|-----------|-------------------|
| Versioned (apps, libraries) | [semantic-release](../RELEASE.md) on push to `main` |
| Infrastructure (e.g. scaleway-home-lab) | Continuous delivery; no semver tags |

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

| Starter | Use when |
|---------|----------|
| CI Pipeline | Application or library with custom lint/test/build steps |
| Infra CI | Bash, YAML, Kubernetes manifest repos |
| Secret Scan | All repositories |
| PR Hygiene | Repos using Conventional Commits for PR titles |
| Semantic Release | Versioned repos only |

## Security reporting

Exploitable vulnerabilities: email **dipak-kumar.singh@dsatechzone.com** per [SECURITY.md](../SECURITY.md). Do not use public issues.

## Override behavior

Member repos can override org defaults by adding local files (e.g. `.github/ISSUE_TEMPLATE/` replaces all org issue templates for that repo). Document overrides in the repository README.
