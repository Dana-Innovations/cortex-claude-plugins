# Platform Constraints

Verified against official Anthropic docs (March 2026). Do not claim otherwise without re-verifying.

## Surface Capability Matrix

| Capability | Chat | Cowork | Code |
|-----------|------|--------|------|
| Skills (standalone, admin-provisioned) | Yes | Yes | Yes |
| Skills (inside a plugin) | **No** | Yes | Yes |
| Plugins | **No** | Yes | Yes |
| Custom MCP connectors | Yes | Yes | Yes |
| Hooks | No | No | Yes |
| Sub-agents | No | Yes | Yes |
| Slash commands (from skills) | Yes | Yes | Yes |
| Slash commands (from plugins) | No | Yes | Yes |
| Local file access | No | Yes | Yes |

## Execution Environments

All three surfaces use the same agentic architecture and skill format, but run in different environments:

| Surface | Environment | Local file access | Terminal |
|---------|------------|-------------------|----------|
| **Code** | User's raw terminal | Full, direct | Yes, unrestricted |
| **Cowork** | Local VM on user's machine | Yes, with permission (isolated but bridged to filesystem) | Via VM (same architecture as Code) |
| **Chat** | Anthropic's cloud sandbox | No | Sandboxed code execution only |

Cowork's VM provides isolation from the host OS but can still read/write local files the user grants access to. It is NOT "no local access" — it's controlled local access.

## Key Constraints
- **Skills do not sync across surfaces.** Each surface requires separate upload/management.
- **The `/v1/skills` API** is for API workspace usage only. Skills uploaded there do NOT appear in claude.ai Chat or Claude Desktop.
- **MCP prompts** (the MCP protocol primitive) do NOT surface in the Chat UI. Only tools surface in Chat.
- **Admin skill provisioning for Chat** is manual ZIP upload only. No API, no GitHub sync.
- **Plugin marketplace** supports GitHub sync (for Cowork/Code distribution). Sync is admin-triggered, not automatic on push.

## Sources
- Skill provisioning: https://support.claude.com/en/articles/13119606
- Plugin usage: https://support.claude.com/en/articles/13837440
- Plugin marketplace admin: https://support.claude.com/en/articles/13837433
- Skills in Claude: https://support.claude.com/en/articles/12512180
- Custom connectors: https://support.claude.com/en/articles/11175166
