#!/bin/bash
# Check if Cortex is configured and authenticated.
# Runs on session start to nudge users who haven't set up yet.

CONFIG_FILE="${HOME}/.cortex/config.json"

if [ ! -f "$CONFIG_FILE" ]; then
  echo '{"systemMessage": "Cortex is not set up yet. Run /cortex:setup to connect your GitHub, Vercel, and Supabase accounts. This only takes a minute."}'
  exit 0
fi

# Check if the config has an API key (basic validation)
if ! grep -q '"apiKey"' "$CONFIG_FILE" 2>/dev/null; then
  echo '{"systemMessage": "Cortex config exists but is missing authentication. Run /cortex:setup to complete setup."}'
  exit 0
fi

# All good — silent success
exit 0
