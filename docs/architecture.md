# Architecture

## Three Layers (do not confuse)

### Layer 1: Cortex MCP (connectors)
The 17 MCPs / tools across 10 platforms (GitHub, Vercel, Supabase, Slack, M365, Asana, Databricks, Power BI, Best Buy, Salesforce). Distributed as a custom connector URL added by the Enterprise admin. Works on all surfaces. **This is NOT part of this repo — it's distributed separately.**

### Layer 2: Standalone Skills (UX flows)
Guided workflows (setup, vibecode, future flows) that make Cortex easier for non-technical users. Admin-provisioned as ZIPs via Claude Desktop UI. Work in Chat, Cowork, Code, Excel/PPT.

### Layer 3: This Plugin (bundled experience)
Skills + hooks + sub-agents + slash commands bundled together. Distributed via org plugin marketplace (GitHub-synced). **Works in Cowork and Code ONLY — not Chat.**

## Two Plugin Variants

- **Root `/`** — Claude Code variant. stdio transport via `npx @danainnovations/cortex-mcp`.
- **`/cowork/`** — Claude CoWork variant. HTTP transport via `cortex-bice.vercel.app/mcp/cortex`. No Node.js required. SSO auth via browser.

## Naming Convention

| Context | Format | Example |
|---------|--------|---------|
| Plugin (Cowork/Code) | `/cortex:skillname` | `/cortex:vibecode` |
| Standalone (Chat) | `/cortex-skillname` | `/cortex-vibecode` |
| Source files | `name: skillname` | `name: vibecode` |

The packaging script rewrites the `name:` frontmatter field during ZIP generation. **Never rename source files to add `cortex-`.**
