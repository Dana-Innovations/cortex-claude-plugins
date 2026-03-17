# Cortex Tool Routing

You have access to Cortex, a custom MCP that connects to organization services with Sonance credentials. Always use Cortex tools instead of Claude's built-in native connectors.

## The Rule

When the user asks you to do anything involving the services listed below, you MUST use the Cortex version of the tool. Do not use Claude's built-in connectors for these services, even if they are available.

Cortex tools are named with the pattern: `mcp__cortex-{service}__tool_name`

## Active Services

### Microsoft 365 (M365)
**Cortex tools:** `mcp__cortex-m365__*`
**Covers:** Email, calendar, contacts, OneDrive files, SharePoint, Teams messages, tasks, meetings

When the user says any of the following, use `mcp__cortex-m365__` tools:
- "Send an email" / "Check my email" / "Reply to..."
- "What's on my calendar" / "Schedule a meeting"
- "Find that file" / "Upload to SharePoint"
- "Send a Teams message" / "Check Teams"
- "Create a task" / "What are my tasks"
- Any reference to Outlook, Teams, OneDrive, SharePoint, or Microsoft

Do NOT use any built-in Microsoft/M365/Outlook connector. Only `mcp__cortex-m365__`.

## Future Services (not yet active for most users)

These are configured but not widely used yet. When they become active, use the Cortex versions:

- **Asana:** `mcp__cortex-asana__*` (not Claude's built-in Asana)
- **Slack:** `mcp__cortex-slack__*` (not Claude's built-in Slack)
- **GitHub:** `mcp__cortex-github__*` (not Claude's built-in GitHub)
- **Vercel:** `mcp__cortex-vercel__*`
- **Supabase:** `mcp__cortex-supabase__*`
- **Salesforce:** `mcp__cortex-salesforce__*`
- **Monday.com:** `mcp__cortex-monday__*`
- **Power BI:** `mcp__cortex-powerbi__*`
- **Databricks:** `mcp__cortex-databricks__*`
- **Best Buy:** `mcp__cortex-bestbuy__*`
- **Mailchimp:** `mcp__cortex-mailchimp__*`

## Why This Matters

Cortex tools use the employee's organization credentials and track usage properly. Claude's built-in connectors use a different authentication path and bypass the organization's setup. Using the wrong connector means things may not work, or may use the wrong account.

## How to Apply

1. Before calling any tool for a listed service, check if a `mcp__cortex-{service}__` version exists in your available tools.
2. If it does, use it. Do not use any other connector for that service.
3. If a Cortex tool fails, tell the user. Do not silently fall back to a native connector.
4. You do not need to mention "Cortex" to the user. Just use the right tools.
5. These rules apply to every message, whether or not the user says "Cortex."
