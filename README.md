# Aether

**Public open-source field · Nexus mesh-native AI lineage**

[![ci](https://github.com/digitaldesignerjazz/Aether/actions/workflows/ci.yml/badge.svg)](https://github.com/digitaldesignerjazz/Aether/actions/workflows/ci.yml)

Aether is the dedicated public repository for open-source development of the Aether field — protocols, specs, contribution surfaces and public agent-skill excerpts that may live in the open.

This is a **medium**, not a private swarm dump.
LuminaCyberspace remains the public cognitive surface. Aether is the contribution field.

> Status: **seeded** · September 2026  
> License: [Apache-2.0](LICENSE)  
> Operator: Esslinger & Co. · GitHub [`digitaldesignerjazz`](https://github.com/digitaldesignerjazz)

---

## What belongs here

- Proposed interfaces and architecture notes
- Contributor, security and conduct policy
- Public schemas with placeholder parameters only
- Public-safe excerpts of agent skills (roles, not private state)

## What does not belong here

- Private correspondence or private persons
- Live keys, tokens, seeds, overlay setup material
- skilllogin dumps and private ledgers
- Copies of private repositories

See [docs/PUBLIC_BOUNDARY.md](docs/PUBLIC_BOUNDARY.md).

---

## Layer map (public)

| Layer | Public role |
|-------|-------------|
| Field | Aether — this repository |
| Cognitive surface | [LuminaCyberspace](https://github.com/digitaldesignerjazz/LuminaCyberspace) |
| Overlay prototypes | [lumina-network](https://github.com/digitaldesignerjazz/lumina-network) |
| Swarm roles | [Lumia / Elara · Lyra · Xen · Elysium](docs/GLOSSARY.md) |
| Chain / runes | Proposed specs only until a public spec says otherwise |

Details: [docs/GLOSSARY.md](docs/GLOSSARY.md) · [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) · [docs/VISION.md](docs/VISION.md) · [docs/CI.md](docs/CI.md)

---

## CI and local hooks

Public field hygiene runs on GitHub-hosted `ubuntu-latest`. No repository secrets. Self-hosted Hannover runners stay off this field.

```bash
./scripts/ci-field-hygiene.sh
./scripts/install-git-hooks.sh   # pre-commit + pre-push, this clone only
```

---

## Contribute

1. Read [CONTRIBUTING.md](CONTRIBUTING.md) and the public boundary.
2. Open an issue before large scope.
3. Small commits on a branch. Pull requests against `main`.

Security reports: [SECURITY.md](SECURITY.md).

---

*Aether — the field that may be shared.*
