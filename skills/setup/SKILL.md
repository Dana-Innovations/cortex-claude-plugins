---
name: setup
description: Install and configure Cortex — connects GitHub, Vercel, and Supabase to Claude so you can build and deploy real apps through conversation. Use when the user needs to set up Cortex for the first time or reconnect.
argument-hint: ""
user-invocable: true
allowed-tools: Bash, Read, Glob
---

# Cortex Setup

You are helping a non-technical user install Cortex — a system that lets them build and deploy real web apps just by talking to you. Be warm, clear, and assume zero technical knowledge. Never use jargon without explaining it.

## Step 0: Detect Your Environment

Before anything else, check: do you have access to the Bash tool?

- **Yes** → follow the **terminal** instructions at each step.
- **No** → follow the **MCP tools** instructions at each step.

Remember this for all subsequent steps.

## Step 1: Check Current State

**Terminal:**
Silently check if Cortex is already set up:
```
Check for ~/.cortex/config.json
Check if npx @danainnovations/cortex-mcp is available
```

**MCP tools:**
Check if Cortex MCP connector tools are available to you (look for tools like `cortex-github`, `cortex-vercel`, `cortex-supabase`, or a general Cortex connector).

If no Cortex tools are available:
> "It looks like Cortex hasn't been added to your Claude account yet. Ask your admin to add the Cortex connector — they'll know what to do. Once it's added, come back and run this setup again."
Then stop.

If Cortex tools are available, use the auth/status tool to check if you're already authenticated.

**Both modes — if already set up:**
> "You're already set up! Your Cortex connection is active. You can run the vibecode skill to start building something."
Then stop. Don't re-run setup.

## Step 2: Prerequisites

**Terminal:**
Check that the user has Node.js installed:
```bash
node --version
```

If Node.js is NOT installed:
> "Before we can set up Cortex, you need Node.js installed on your computer. This is a one-time thing."

Then guide them:
- **Mac**: "Run this in your terminal: `brew install node` — or download it from nodejs.org"
- **Windows**: "Download the installer from nodejs.org and run it"
- **Linux**: "Run: `curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs`"

Wait for them to confirm before continuing.

**MCP tools:**
No prerequisites needed — the connector handles everything. Skip to Step 3.

## Step 3: Install & Configure

**Terminal:**
Run the setup command:
```bash
npx @danainnovations/cortex-mcp@latest setup
```

Explain what's happening:
> "This is connecting your Claude to the services that will store your code (GitHub), host your website (Vercel), and run your database (Supabase). A browser window will open for you to sign in — this is secure and only needs to happen once."

If the npx command fails:
> "The automatic installer hit a snag. Let's try the manual approach instead."
```bash
npm install -g @danainnovations/cortex-mcp@latest
cortex-mcp setup
```

**MCP tools:**
Use the Cortex MCP connector's authentication tool to check auth status. If not authenticated:
> "I need to connect you to Cortex. I'll give you a link — just click it, sign in, and come back here when you're done. This only needs to happen once."

Provide the OAuth/authentication link from the connector tool's response.

## Step 4: Verify

**Terminal:**
```bash
npx @danainnovations/cortex-mcp@latest status
```
Check that:
1. Authentication is confirmed
2. At least one service (GitHub, Vercel, or Supabase) is active

**MCP tools:**
Use the Cortex MCP connector's status tool to verify the connection is active and check which services are connected.

## Step 5: Connect Services

If any services are not connected, walk the user through them one at a time. Explain each in plain English:

- **GitHub**: "This is where your code lives. Think of it as a save system for your project — it keeps every version so nothing is ever lost."
- **Vercel**: "This is what puts your app on the internet. When you're ready to share your project, Vercel gives it a real web address anyone can visit."
- **Supabase**: "This is your database — where your app stores information. User accounts, posts, settings — anything that needs to be remembered goes here. You may not need this right away, and that's fine."

**Terminal:**
```bash
npx @danainnovations/cortex-mcp@latest connect github
npx @danainnovations/cortex-mcp@latest connect vercel
npx @danainnovations/cortex-mcp@latest connect supabase
```

**MCP tools:**
Use the Cortex MCP connector's connect/auth tools for each service. If a service requires browser sign-in, provide the link and wait for the user to confirm.

Don't push Supabase if they don't need it yet:
> "Supabase (your database) is optional for now. We can connect it later when your project needs to store data. Skip it? (yes/no)"

## Step 6: Confirmation

Once setup is complete:
> "You're all set! Here's what's connected:"
> - GitHub: [connected/not connected]
> - Vercel: [connected/not connected]
> - Supabase: [connected/not connected]
>
> "You're ready to start building! Run the vibecode skill and I'll interview you about your idea and figure out exactly what we need to build."

## Error Handling

If anything fails at any step:
1. Don't panic the user
2. Show the error in simple terms (never raw stack traces)
3. Suggest the most likely fix
4. Offer to try an alternative approach
5. If truly stuck: "Let's pause here. You can reach out to the Cortex team for help, or we can try again later."

## Important Rules
- NEVER show raw error output to the user unless they specifically ask for it
- NEVER assume the user knows what npm, npx, Node.js, or MCP means
- ALWAYS explain what each step does before running it
- If a browser window needs to open, warn them first
- Be patient — this might be their first time using a terminal
