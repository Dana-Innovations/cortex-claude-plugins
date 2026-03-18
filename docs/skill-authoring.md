# Skill Authoring: Three-Surface Thinking

Every skill runs across three execution environments. When creating or refining a skill, always have all three in mind.

## The three surfaces

| Surface | Environment | What's available | What's NOT available |
|---------|------------|-----------------|---------------------|
| **Code** | User's raw terminal | Full filesystem, bash, npx, git, all CLI tools | — |
| **Cowork** | Local VM on user's machine | Filesystem (bridged, with permission), same agentic architecture as Code | Direct host OS access (isolated) |
| **Chat** | Anthropic cloud sandbox | Sandboxed code execution (Python, bash), MCP connector tools | Local filesystem, terminal, npx, local config files |

## The core question

For every skill, ask:

> "Are the flows different enough across surfaces to warrant separate skills, or just conditional logic within one?"

### When to use one skill with branching
- The core flow is the same (e.g., interview → classify → output)
- Only the final step differs (e.g., "check local config" vs "call MCP tool")
- Maintaining two files would mean duplicating 80%+ of the content

### When to create separate skills
- The flow is fundamentally different (e.g., terminal-based setup vs HTTP-based setup)
- One surface can't do the core action at all (not just differently — at all)
- Conditional logic would make the SKILL.md confusing or fragile

## Naming separate surface variants
If a skill needs a surface-specific variant, use a suffix:
- `setup` — the default (Code/Cowork, terminal-based)
- `setup-web` — Chat variant (HTTP-based, no terminal)

Both get `cortex-` prefixed when packaged for Chat standalone distribution.

## Writing surface-aware conditional logic
Skills are instructions, not code. You can branch with plain English:

```markdown
## Step 4: Connect

If you have terminal access (Claude Code or Cowork):
  Run `npx @danainnovations/cortex-mcp@latest connect github`

If you're in a sandboxed environment without terminal (Chat):
  Use the Cortex MCP connector tools to check connection status.
  If not connected, provide the user with the OAuth link.
```

Claude is smart enough to detect its own environment and follow the right branch.
