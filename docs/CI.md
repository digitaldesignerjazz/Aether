# CI / CD on the public field

Aether uses **GitHub Actions**. CI is public and secret-free. CD that touches live overlay, household nodes or private OS trees does **not** belong here.

## Now (CI)

Workflow: [`.github/workflows/ci.yml`](../.github/workflows/ci.yml)

| Piece | Choice |
|-------|--------|
| Trigger | `push` to `main`, pull requests, `workflow_dispatch` |
| Runner | GitHub-hosted `ubuntu-latest` |
| Permissions | `contents: read` |
| Job | `field-hygiene` via `scripts/ci-field-hygiene.sh` |
| Secrets | none |

The checker asserts required public surfaces exist and scans for private-looking filenames and key/seed patterns.

Local run:

```bash
./scripts/ci-field-hygiene.sh
```

## Later (still public)

When specs or code land:

- schema validation for proposed JSON / YAML interfaces
- unit tests for public libraries
- documentation site via GitHub Pages from `docs/`
- tagged GitHub Releases for versioned specs (Apache-2.0)

## Never on this repository

Sibling workflows that stay **out** of Aether:

- Hannover overlay apply (LuminaCyberspace, self-hosted / vars)
- Songs backup on self-hosted runners
- Any job that needs NetBird setup keys, wallet material or household paths

Those runners (`hannover-runner`, `cyberspace-runner`) are part of the lineage. They are not the public field.

## Status badge

```md
![ci](https://github.com/digitaldesignerjazz/Aether/actions/workflows/ci.yml/badge.svg)
```
