# Contributing to dsatechzone-solutions-hub

Thank you for contributing. This document defines how we work across all repositories in the organization.

## Development workflow (TDD-first)

We follow **Test-Driven Development**:

1. **Red** — Write a failing test that describes the desired behavior.
2. **Green** — Implement the minimum code to make the test pass.
3. **Refactor** — Improve structure without changing behavior; tests must stay green.

Rules:

- No production logic merged without corresponding automated tests (unit minimum; integration or E2E when behavior crosses module or service boundaries).
- Name tests after behavior: `should_reject_expired_token`, not `test_auth_1`.
- Tests must be deterministic — no flaky tests, no uncontrolled time or network dependencies.

## Branching and commits

- **Trunk-based development:** short-lived branches from `main`.
- **Branch names:** `type/short-description` (e.g. `feat/add-oauth-client`, `fix/null-user-handling`).
- **[Conventional Commits](https://www.conventionalcommits.org/):** required for versioned repos using semantic-release.

| Prefix | Purpose |
|--------|---------|
| `feat:` | New feature (minor release) |
| `fix:` | Bug fix (patch release) |
| `docs:` | Documentation only |
| `test:` | Tests only |
| `refactor:` | Code change without behavior change |
| `chore:` | Maintenance, deps, tooling |
| `ci:` | CI/CD changes |
| `perf:` | Performance improvement |

Breaking changes: use `BREAKING CHANGE:` in the commit footer, or `feat!:` / `fix!:` with the `conventionalcommits` preset.

- One logical change per pull request; keep diffs reviewable (target under ~400 lines when possible).

## Pull request requirements

- Link the related issue (`Fixes #123` or `Refs #123`).
- Complete the org pull request template.
- All CI checks must pass before merge.
- At least one approving review; two for infra or security-sensitive changes (see [ORG_GOVERNANCE.md](docs/ORG_GOVERNANCE.md)).
- Complete the self-review checklist in the PR template.

## Code quality

- Lint and format before pushing (use language-appropriate tools per repository).
- No commented-out code or debug logging left in production paths.
- Document public APIs; update docs in the same PR when behavior changes.
- Prefer small, composable functions; avoid premature abstraction.

## Security

- **Never** commit secrets, API keys, tokens, passwords, or PII.
- Use `.env.example` or `secrets.example/` for templates; store real credentials in a secret manager or vault.
- Address known CVEs in dependencies promptly.
- Run secret scanning locally or via CI before opening a PR.

## Testing pyramid

| Layer | Scope | When |
|-------|-------|------|
| Unit | Isolated functions/modules | Always for application logic |
| Integration | DB, API, module boundaries | When components interact |
| E2E / smoke | Critical user paths | Sparingly, high-value flows |

## Infrastructure repositories

For bash, YAML, and Kubernetes manifest repos (e.g. `scaleway-home-lab`):

| Tool | Purpose | When required |
|------|---------|---------------|
| [shellcheck](https://www.shellcheck.net/) | Bash correctness | Any `*.sh` changed |
| [yamllint](https://yamllint.readthedocs.io/) | YAML style and syntax | Any `*.yml` / `*.yaml` changed |
| [kubeconform](https://github.com/yannh/kubeconform) | K8s manifest schema validation | Manifests under `config/k8s/` changed |

Adopt the org **Infra CI** workflow starter or run equivalent checks locally.

Where unit tests are impractical, document verification steps in the PR (runbook phase, cluster check, scripted validation).

Infra repos do **not** use semantic-release — see [RELEASE.md](RELEASE.md).

## Definition of Done

- [ ] Tests added or updated and passing locally and in CI
- [ ] Documentation updated (README, runbook, or inline as appropriate)
- [ ] No secrets or credentials in the diff
- [ ] Reviewer feedback addressed or deferred with a linked issue
- [ ] Rollback or revert path understood for infra changes

## Releases

Versioned application and library repos use [semantic-release](RELEASE.md). Infra repos use continuous delivery without semver tags.

## Code of Conduct

All contributors must follow [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).
