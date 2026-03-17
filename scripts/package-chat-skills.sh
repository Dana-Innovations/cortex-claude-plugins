#!/bin/bash
# Package each skill folder as a standalone ZIP for Chat distribution.
# Prefixes skill names with "cortex-" so Chat users see /cortex-setup, /cortex-vibecode, etc.
# Output goes to dist/chat-skills/ — upload these via Claude Desktop:
#   Organization settings > Skills > "+ Add"
#
# Usage: ./scripts/package-chat-skills.sh

set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST_DIR="$REPO_ROOT/dist/chat-skills"
STAGING_DIR="$REPO_ROOT/dist/.staging"

rm -rf "$DIST_DIR" "$STAGING_DIR"
mkdir -p "$DIST_DIR"

count=0
for skill_dir in "$REPO_ROOT"/skills/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name=$(basename "$skill_dir")
    chat_name="cortex-${skill_name}"

    if [ ! -f "$skill_dir/SKILL.md" ]; then
        echo "Skipping $skill_name — no SKILL.md found"
        continue
    fi

    # Stage a copy with the prefixed folder name
    stage="$STAGING_DIR/$chat_name"
    mkdir -p "$stage"
    cp -r "$skill_dir"/* "$stage/"

    # Rewrite the name field in SKILL.md frontmatter
    sed -i '' "s/^name: ${skill_name}$/name: ${chat_name}/" "$stage/SKILL.md"

    # Zip the staged folder
    (cd "$STAGING_DIR" && zip -r "$DIST_DIR/${chat_name}.zip" "$chat_name/")
    echo "Packaged: dist/chat-skills/${chat_name}.zip"
    count=$((count + 1))
done

rm -rf "$STAGING_DIR"

echo ""
echo "Done. $count skill(s) packaged in dist/chat-skills/"
echo "Upload these ZIPs via Claude Desktop: Organization settings > Skills"
