# Development & Testing Workflow

## Local Testing (safe — no one else sees your changes)

### Test plugin in Claude Code
```bash
claude --plugin-dir ./Cortex-master-plugin
```
- Loads the plugin locally without marketplace installation
- Use `/cortex:setup`, `/cortex:vibecode` etc. to test
- Run `/reload-plugins` to pick up changes without restarting
- Local copy takes precedence over installed marketplace version

### Test standalone skills in Chat
1. Run `./scripts/package-chat-skills.sh` to generate ZIPs
2. Upload to your **personal** skills (Customize > Skills > "+"), NOT org-wide
3. Personal skills are private to your account — no one else sees them
4. Test `/cortex-setup`, `/cortex-vibecode` in the Chat tab

## Publishing (when ready for the company)

### Cowork/Code (plugin marketplace)
1. Merge branch to `main`
2. Admin opens Claude Desktop → Organization settings → Plugins
3. Find the marketplace → click **"Check for updates"**
4. Sync is manual — does NOT auto-deploy on push

### Chat (standalone skills)
1. Run `./scripts/package-chat-skills.sh`
2. Admin uploads ZIPs via Claude Desktop → Organization settings → Skills → "+ Add"
3. Skills become org-wide (enabled by default for all users)

## Safety Rules
- **Develop on branches.** Only merge to main when ready.
- **Never upload WIP ZIPs to org-wide skills.** Use personal skill upload for testing.
- **Marketplace sync is admin-triggered.** This is the safety gate for Cowork/Code.
- **Chat skill uploads are manual.** This is the safety gate for Chat.
