# Deploy Changes

Push your latest changes live. This takes whatever you've been working on and makes it available at your project's web address.

## How it works

When someone runs this command:

1. Ask which project they want to deploy (if they have multiple)
2. Use the Cortex GitHub tools to check for uncommitted changes
3. If there are changes, commit and push them
4. Use the Cortex Vercel tools to trigger a deployment
5. Wait for the deployment to complete and share the live URL

Walk them through it in plain language:

> "Saving your latest changes... done."
> "Pushing to your website... this takes about 30 seconds."
> "Your site is live at [url] with the latest changes!"

If the deployment fails:
- Explain what went wrong in simple terms
- Suggest the most likely fix
- Offer to help resolve it

## Important Rules

- Never show raw build logs unless asked
- If there are no changes to deploy, tell them: "Everything is already up to date!"
- Frame it as "updating your website" not "deploying to production"
