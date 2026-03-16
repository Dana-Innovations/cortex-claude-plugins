# Check Project Status

Check the current state of a project that was built with Cortex. Shows what's deployed, what services are connected, and whether everything is healthy.

## How it works

When someone runs this command, check the status of their project across all connected services.

Use the available Cortex MCP tools to:

1. **GitHub**: Check the repository — latest commit, open pull requests, any issues
2. **Vercel**: Check the deployment — is it live? Any build errors? What's the URL?
3. **Supabase**: Check the database — is it running? How many tables? Any issues?

Present everything in plain English:

> **Your Project: [name]**
>
> **Website**: Live at [url] — last updated [date]
> **Code**: [X] files on GitHub — last change: "[commit message]"
> **Database**: Running — [X] tables, [X] rows total
>
> Everything looks good! (or: Here's what needs attention: ...)

If something is wrong, explain it simply and suggest a fix. Never show raw error messages unless asked.

## Important Rules

- Ask which project to check if they have multiple
- Use simple language — "your website" not "your Vercel deployment"
- If a service isn't connected, say so and offer to help set it up
- Don't overwhelm with data — highlight what matters
