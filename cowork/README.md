# Cortex CoWork Plugin

Build and deploy real web apps through conversation — no coding knowledge required. This plugin connects Claude CoWork to GitHub, Vercel, and Supabase through Cortex, giving non-technical users the ability to go from idea to live website.

## Commands

### `/cortex:vibecode`
The main experience. Interviews you about your project idea, figures out what you actually need, creates a plan, and then builds and deploys it — all through conversation.

### `/cortex:check-project`
Check the status of a project you've built. Shows whether your website is live, your code is saved, and your database is running.

### `/cortex:deploy`
Push your latest changes live. Updates your website with whatever you've been working on.

## Skills

### Project Advisor
Automatically assesses project complexity and recommends the simplest infrastructure that works. Knows when you need just a website vs a full app with user accounts and a database.

### Plain English
Translates all technical concepts into language anyone can understand. Active whenever Cortex tools are being used.

## Installation

### For organizations (admin)
1. Go to Organization Settings → Plugin Marketplaces
2. Connect the GitHub repo: `Dana-Innovations/cortex-claude-plugins`
3. Enable the `cowork` plugin
4. Set installation mode (auto-install recommended)
5. Set the `CORTEX_API_KEY` environment variable

### For individual users
1. Open CoWork tab in Claude Desktop
2. Click **+** → **Browse plugins**
3. Search for "Cortex"
4. Click **Install**

## What gets built

The plugin determines the simplest setup for your project:

| What you need | What gets created |
|---|---|
| A website (portfolio, landing page) | GitHub repo + Vercel hosting |
| An app that stores data | GitHub + Vercel + Supabase database |
| An app with user accounts | GitHub + Vercel + Supabase with authentication |
| A complex app with integrations | Full stack + additional services |

It always starts simple and tells you when you'd need to upgrade.
