# Cortex Master Plugin

UX layer on top of [Dana-Innovations/Cortex](https://github.com/Dana-Innovations/Cortex). Guided flows for non-technical Dana Innovations employees on Claude Enterprise. **Not Cortex itself.**

## Architecture → [docs/architecture.md](docs/architecture.md)

| Layer | Reaches |
|-------|---------|
| **Cortex MCP** (connectors) | Chat, Cowork, Code, Mobile — all surfaces |
| **Standalone skills** (admin-provisioned ZIPs) | Chat, Cowork, Code, Excel/PPT |
| **This plugin** (bundled) | Cowork and Code ONLY |

**Plugins don't work in Chat.** Skills must also exist standalone. See [docs/dual-deployment.md](docs/dual-deployment.md).

## Platform Constraints → [docs/platform-constraints.md](docs/platform-constraints.md)

Do NOT assume. Verify against official docs before claiming capabilities.
- Skills do NOT sync across surfaces
- `/v1/skills` API does NOT provision to claude.ai
- MCP prompts do NOT surface in Chat
- Plugin skills are invisible to Chat users

## Skills

Source of truth: `skills/` directory. Never rename source files — the packaging script handles `cortex-` prefixing for Chat.

| Skill | Plugin name | Chat name | Chat-ready? |
|-------|------------|-----------|-------------|
| setup | `/cortex:setup` | `/cortex-setup` | Limited (needs terminal) |
| vibecode | `/cortex:vibecode` | `/cortex-vibecode` | Yes |

## Dev Workflow → [docs/dev-workflow.md](docs/dev-workflow.md)

**Test locally (safe):**
- Plugin: `claude --plugin-dir ./Cortex-master-plugin`
- Chat: upload ZIP as personal skill (Customize > Skills), not org-wide

**Publish (when ready):**
- Plugin: merge to main → admin clicks "Check for updates" (manual, not auto)
- Chat: `./scripts/package-chat-skills.sh` → admin uploads ZIPs to org skills

**Safety:** develop on branches. Both publish paths are admin-triggered.

## Repo Structure

```
skills/              ← SINGLE SOURCE OF TRUTH
scripts/             ← package-chat-skills.sh (builds cortex-*.zip)
hooks/               ← session start hook (Code only)
cowork/              ← CoWork variant (HTTP transport)
.claude-plugin/      ← plugin manifest
dist/                ← generated ZIPs (gitignored)
docs/                ← detailed documentation
```

## Guidelines

1. Skills are the primary deliverable
2. Write for non-technical users — plain English, no jargon
3. Test in both plugin and standalone contexts before shipping
4. One SKILL.md per skill — if Chat needs a different flow, create a separate skill
5. Chat users have no terminal, no filesystem, no local access

## Documentation Rules

- **CLAUDE.md stays under 100 lines.** It is an index, not a knowledge base.
- **Detail goes in `docs/`.** One file per topic. CLAUDE.md links to it.
- **When adding new context**, create or update a doc in `docs/`, then add a one-line pointer here.
- **Never inline large blocks** of instructions, constraints, or workflows into CLAUDE.md.

## References

- **Cortex repo**: github.com/Dana-Innovations/Cortex
- **Developer**: TCP (thomas.palmer@sonance.com)
- **Cortex MCP**: `@danainnovations/cortex-mcp`
- **CoWork endpoint**: `cortex-bice.vercel.app/mcp/cortex`
