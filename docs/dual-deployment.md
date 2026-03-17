# Dual Deployment

## The Problem
Plugins don't work in the Chat tab. Only Cowork and Code. But many Dana employees use Chat. Skills bundled inside a plugin are invisible to Chat users.

Standalone skills DO work in Chat when admin-provisioned. They use the exact same SKILL.md format.

**Therefore: every skill must also be deployable as a standalone skill for Chat users.**

## Path 1: Plugin Marketplace (Cowork/Code)
- This repo syncs to the org's private plugin marketplace via GitHub
- Users get the full bundled experience: skills, hooks, slash commands, sub-agents
- Sync is **admin-triggered** (click "Check for updates"), not automatic

## Path 2: Standalone Skills (Chat)
- Each skill folder under `skills/` gets packaged as an individual ZIP
- The packaging script prefixes names with `cortex-` (source stays `setup`, ZIP becomes `cortex-setup`)
- The `name:` field in SKILL.md frontmatter is rewritten during packaging
- Admin uploads ZIPs via Claude Desktop → Organization settings → Skills
- Run `scripts/package-chat-skills.sh` to generate ZIPs in `dist/chat-skills/`
- **Requires a human admin — there is no API for this today**

## Skill Authoring Implications
- Skills must work in BOTH contexts where possible
- Plugin context: hooks, sub-agents, local filesystem, terminal access
- Chat context: sandboxed VM, no local filesystem, no terminal, code execution only
- If a skill requires terminal/local access (like `setup`), it needs a Chat-compatible variant or should be plugin-only
- Conversational skills (like `vibecode`) work fine in both contexts
