# Set Up Cortex

Connect your Claude to GitHub, Vercel, and Supabase so you can build and deploy real web apps through conversation. This only needs to happen once.

## How it works

When someone runs this command, you are helping them install and configure Cortex. Assume zero technical knowledge. Be warm, patient, and explain everything in plain language.

### Step 1: Check if already set up

Run:
```bash
test -f ~/.cortex/config.json && grep -q '"apiKey"' ~/.cortex/config.json 2>/dev/null && echo "configured" || echo "not configured"
```

If already configured, say:
> "You're already set up! Your Cortex connection is active. Run /cortex:vibecode to start building something."

Then stop.

### Step 2: Check for Node.js

Run:
```bash
node --version 2>/dev/null || echo "not installed"
```

If not installed, install it:
```bash
apt-get update && apt-get install -y nodejs npm 2>/dev/null || (curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs)
```

Tell the user:
> "Installing some tools we need — this takes about 30 seconds."

### Step 3: Run Cortex setup

```bash
npx -y @danainnovations/cortex-mcp@latest setup
```

Explain what's happening:
> "I'm connecting your Claude to three services:
> - **GitHub** — saves your code (like automatic backups)
> - **Vercel** — puts your app on the internet (gives it a real web address)
> - **Supabase** — stores your data (user accounts, saved info)
>
> A sign-in page may open in your browser. This is secure and only happens once."

If the npx command fails, try the fallback:
```bash
npm install -g @danainnovations/cortex-mcp@latest && cortex-mcp setup
```

If that also fails, say:
> "The automatic installer ran into a problem. Here's what we can try: [explain the specific error in simple terms and suggest a fix]."

### Step 4: Verify it worked

```bash
npx -y @danainnovations/cortex-mcp@latest status
```

Check that authentication is confirmed and at least one service is connected.

### Step 5: Connect services

For any services not yet connected, walk through them one at a time. Explain each one before connecting:

**GitHub:**
> "This is where your code lives — think of it as a save system that keeps every version of your project, so nothing is ever lost."
```bash
npx -y @danainnovations/cortex-mcp@latest connect github
```

**Vercel:**
> "This is what puts your app on the internet. When you're ready to share, Vercel gives it a real web address anyone can visit."
```bash
npx -y @danainnovations/cortex-mcp@latest connect vercel
```

**Supabase:**
> "This is your database — where your app stores information like user accounts or saved settings. You might not need this right away, and that's totally fine. Want to connect it now or skip for later?"
```bash
npx -y @danainnovations/cortex-mcp@latest connect supabase
```

Only connect Supabase if they say yes. It's optional.

### Step 6: Done

> "You're all set! Here's what's connected:"
> - GitHub: [connected / not connected]
> - Vercel: [connected / not connected]
> - Supabase: [connected / skipped]
>
> "Run **/cortex:vibecode** to start building your project. I'll ask you about your idea and figure out exactly what we need."

## Important Rules

- NEVER show raw error output unless the user asks for it
- NEVER assume the user knows what npm, npx, Node.js, or any technical term means
- ALWAYS explain what each step does before running it
- If a browser window needs to open, warn them first
- If something fails, stay calm, explain in simple terms, and suggest a fix
- Be patient — this might be their first time doing anything like this
