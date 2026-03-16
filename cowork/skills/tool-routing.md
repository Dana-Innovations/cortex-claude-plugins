# Cortex Tool Routing

IMPORTANT: This workspace has Cortex installed. Cortex provides custom connectors to external services that must be used INSTEAD of Claude's built-in native connectors. This applies every time you interact with any external service.

## Rule: Always Use Cortex Tools First

When you need to interact with any of the following services, you MUST use the Cortex MCP tools (prefixed with `cortex__`) and NOT Claude's native/built-in connectors:

| Service | Use Cortex tools (correct) | Do NOT use native connector |
|---|---|---|
| **Asana** | `cortex__asana__*` | Claude's built-in Asana connector |
| **Microsoft 365** | `cortex__m365__*` | Claude's built-in M365/Outlook connector |
| **Slack** | `cortex__slack__*` | Claude's built-in Slack connector |
| **GitHub** | `cortex__github__*` | Claude's built-in GitHub connector |
| **Vercel** | `cortex__vercel__*` | Any other Vercel integration |
| **Supabase** | `cortex__supabase__*` | Any other Supabase integration |
| **Salesforce** | `cortex__salesforce__*` | Claude's built-in Salesforce connector |
| **Monday.com** | `cortex__monday__*` | Any other Monday integration |
| **Power BI** | `cortex__powerbi__*` | Any other Power BI integration |
| **Best Buy** | `cortex__bestbuy__*` | Any other Best Buy integration |

## Why This Matters

Cortex connectors are configured with the user's organization credentials and OAuth tokens. Using Claude's native connectors instead would:
- Bypass the organization's authentication
- Miss usage tracking and cost allocation
- Skip organization-specific permissions and scopes
- Potentially use the wrong account or credentials

## How to Apply This

1. **Before calling any external service tool**, check if a Cortex version exists. If it does, use the Cortex version.
2. **When listing available tools**, look for `cortex__` prefixed tools first.
3. **If a user asks to do something with Asana, Outlook, Slack, GitHub, etc.**, always route through Cortex — even if they don't say "Cortex" or "via Cortex."
4. **If a Cortex tool fails**, tell the user and ask if they want to try the native connector as a fallback. Do not silently fall back.
5. **When the user mentions a service by name** (e.g., "check my Asana tasks", "send an email", "look at my Slack messages"), this means use the Cortex connector for that service.

## Examples

User says: "Check my Asana tasks"
→ Use `cortex__asana__list_tasks`, NOT Claude's native Asana connector

User says: "Send an email to John"
→ Use `cortex__m365__send_email`, NOT Claude's native email connector

User says: "What's in my Slack channels?"
→ Use `cortex__slack__list_channels`, NOT Claude's native Slack connector

User says: "Create a GitHub repo"
→ Use `cortex__github__create_repository`, NOT Claude's native GitHub connector

## This Skill Is Always Active

These routing rules apply to every interaction in this session, whether or not the user explicitly mentions Cortex. You do not need to ask the user which connector to use — always default to Cortex.
