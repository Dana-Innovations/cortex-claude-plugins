# Cortex Claude Plugin

A Claude Code plugin that gives non-technical builders real infrastructure — GitHub, Vercel, and Supabase — through natural conversation.

## Install

```bash
claude plugin install cortex@Dana-Innovations/cortex-claude-plugins
```

## What You Get

### `/cortex:setup`
Guided installation of the Cortex MCP server. Connects your Claude to GitHub (version control), Vercel (hosting), and Supabase (database). Explains everything in plain English — no terminal knowledge required.

### `/cortex:vibecode`
Start building a new project. Interviews you about your idea, figures out what you actually need, and produces a clear plan before writing any code. Determines whether you need a simple static site or a full backend with user accounts and a database.

## How It Works

1. **Install the plugin** (one time)
2. **Run `/cortex:setup`** — authenticates and connects your services
3. **Run `/cortex:vibecode`** — describe your idea, get a plan, then build

The plugin automatically checks if Cortex is configured when you start a session. If not, it'll nudge you to run setup.

## Infrastructure Tiers

The vibecode skill determines the simplest infrastructure that meets your needs:

| Tier | What It Is | When You Need It |
|------|-----------|------------------|
| 0 | Static site (GitHub + Vercel) | Portfolio, landing page, docs |
| 1 | Client app (GitHub + Vercel) | Tools, calculators, single-user apps |
| 2 | Backend-lite (+ Supabase) | Forms, public data, no login needed |
| 3 | Full stack (+ Supabase auth) | User accounts, personalized data |
| 4 | Multi-service (+ integrations) | Payments, email, external APIs |

It always recommends the lowest tier and tells you what would trigger upgrading later.

## Plugin Structure

```
.claude-plugin/plugin.json    # Plugin manifest + MCP server config
.mcp.json                     # Cortex MCP server definition
hooks/hooks.json              # Session start hook (config check)
skills/setup/SKILL.md         # /cortex:setup skill
skills/setup/scripts/         # Hook scripts
skills/vibecode/SKILL.md      # /cortex:vibecode skill
```

## Requirements

- [Claude Code](https://claude.ai/code) CLI
- Node.js 18+
- A Cortex account (created during setup)

## License

MIT
