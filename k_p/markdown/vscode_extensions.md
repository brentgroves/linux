# Markdown VS Code Extensions

- Markdown PDF
- Markdown Preview Enhanced
- Markdown Preview Mermaid
- MarkdownLint

## Configure Auto-Fix on Save

You can enable auto-correction using two different methods in your VS Code settings:

- **Option A:** Code Actions (Recommended)

This triggers specifically the fixAll command for markdownlint.

1. Open your command palette (Ctrl+Shift+P or Cmd+Shift+P).
2. Type "Open User Settings (JSON)" and select it.
3. Add the following configuration:
json
"editor.codeActionsOnSave": {
    "source.fixAll.markdownlint": "explicit"
}
