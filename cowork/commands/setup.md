# Set Up Cortex

Connect the user's Cortex account by authenticating directly through the Cortex API. No terminal, no npx, no Node.js required.

## How it works

This setup uses HTTP calls to the Cortex backend and presents auth URLs for the user to click. Everything happens through conversation.

### Step 1: Check if already authenticated

Run:
```bash
test -f ~/.cortex-mcp/credentials.json && cat ~/.cortex-mcp/credentials.json 2>/dev/null
```

If the file exists and has an `apiKey`, say:
> "You're already connected! Run **/cortex:vibecode** to start building a project."

Then stop.

### Step 2: Initiate SSO authentication

Run:
```bash
curl -s -X POST https://cortex-bice.vercel.app/api/v1/auth/employee/initiate \
  -H "Content-Type: application/json" \
  -d '{}'
```

This returns JSON with `session_id` and `auth_url`. Extract both.

Present the auth URL to the user as a clickable link:

> "Click this link to sign in:"
>
> **[Sign in to Cortex](the_auth_url_here)**
>
> "Once you've signed in, come back here and tell me you're done."

### Step 3: Poll for completion

After the user says they've signed in (or periodically), poll:

```bash
curl -s https://cortex-bice.vercel.app/api/v1/auth/employee/poll/SESSION_ID_HERE
```

Check the `status` field in the response:
- `"pending"` — they haven't completed sign-in yet. Wait and try again.
- `"completed"` — success! Extract `api_key`, `employee_name`, and `employee_email` from the response.
- `"expired"` — session timed out. Go back to Step 2 and start over.
- `"error"` — show the `error_message` in plain language.

When polling returns `"pending"`, wait a few seconds and poll again. Do this automatically — don't make the user tell you to check each time. Poll up to 60 times (about 3 minutes).

### Step 4: Save credentials

Once status is `"completed"`, write the credentials file:

```bash
mkdir -p ~/.cortex-mcp && chmod 700 ~/.cortex-mcp
cat > ~/.cortex-mcp/credentials.json << 'CREDENTIALS'
{
  "apiKey": "THE_API_KEY_FROM_POLL",
  "email": "THE_EMAIL_FROM_POLL",
  "name": "THE_NAME_FROM_POLL",
  "authenticatedAt": "CURRENT_ISO_TIMESTAMP"
}
CREDENTIALS
chmod 600 ~/.cortex-mcp/credentials.json
```

Replace the placeholder values with the actual values from the poll response.

### Step 5: Connect services (optional)

After authentication, offer to connect individual services. For each service, use the OAuth connect flow:

```bash
curl -s -X POST https://cortex-bice.vercel.app/api/v1/oauth/connect/PROVIDER/initiate \
  -H "x-api-key: THE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}'
```

Replace PROVIDER with: `github`, `vercel`, or `supabase`.

This returns `authorization_url`. Present it the same way:

> "Click this link to connect your GitHub account:"
>
> **[Connect GitHub](the_authorization_url_here)**

Then poll for completion:
```bash
curl -s https://cortex-bice.vercel.app/api/v1/oauth/connect/poll/SESSION_ID \
  -H "x-api-key: THE_API_KEY"
```

Same status pattern: `pending`, `completed`, `expired`, `error`.

Ask about each service one at a time:
> "Want to connect GitHub (code storage)?" → if yes, run the flow
> "Want to connect Vercel (website hosting)?" → if yes, run the flow
> "Want to connect Supabase (database)? You can skip this for now." → if yes, run the flow

### Step 6: Done

> "You're all set! Here's what's connected:"
> - Signed in as: [name] ([email])
> - GitHub: [connected / skipped]
> - Vercel: [connected / skipped]
> - Supabase: [connected / skipped]
>
> "Run **/cortex:vibecode** to start building a project."

## Important Rules

- Do NOT tell the user to open a terminal. Everything happens through links they click.
- Do NOT explain what SSO, OAuth, API keys, or tokens are.
- Do NOT show raw JSON responses. Parse them and speak in plain English.
- If a curl command fails with a network error, check if `cortex-bice.vercel.app` is in the egress allowlist. Tell the user: "Your organization needs to allow access to cortex-bice.vercel.app. Ask your IT admin to add it to the allowed domains."
- If the auth URL fails or expires, just start over. Don't panic.
- Keep the whole flow conversational — this should feel like a 2-minute signup, not a technical process.
