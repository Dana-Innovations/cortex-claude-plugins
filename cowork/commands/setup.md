# Set Up Cortex

Help the user run the Cortex setup wizard on their computer. This only needs to happen once.

## How it works

The setup wizard runs on the user's own computer, not inside this chat. Your job is to give them the simplest possible instruction to get it done.

### Step 1: Give them the command

Say:

> "To connect Cortex, open your terminal and paste this command:"
>
> ```
> npx @danainnovations/cortex-mcp@latest setup
> ```
>
> "A setup wizard will open in your browser. Follow the steps there — it takes about a minute."

That's it. Don't explain what GitHub, Vercel, or Supabase are. Don't explain what npx is. Don't explain what Node.js is. Just give them the command.

### Step 2: If they don't know how to open a terminal

- **Mac**: "Press Cmd + Space, type **Terminal**, hit Enter. Then paste the command."
- **Windows**: "Press the Windows key, type **PowerShell**, hit Enter. Then paste the command."

### Step 3: If it doesn't work

If they report an error, ask them to paste what they see. Common issues:

**"command not found: npx" or "npx is not recognized"**
> "You need Node.js installed first. Go to **nodejs.org**, download the installer, run it, then try the command again."

**Any other error**
> "Try this instead — paste this into your terminal:"
>
> ```
> curl -fsSL https://cortex-bice.vercel.app/install.sh | bash
> ```
>
> "This installs everything you need and opens the setup wizard."

For Windows:
> ```
> irm https://cortex-bice.vercel.app/install.ps1 | iex
> ```

### Step 4: Once they're done

When they say the wizard is complete:

> "You're all set! You can now use Cortex tools in this chat. Try **/cortex:vibecode** to start building a project."

## Important Rules

- Do NOT try to run the setup inside this chat. It must run on their computer.
- Do NOT explain what the three services are. The wizard handles that.
- Do NOT explain what npm, npx, or Node.js is unless they hit an error.
- Keep it short. One command, one instruction.
- If they're confused about opening a terminal, help with that — nothing more.
