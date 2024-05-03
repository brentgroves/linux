# VSCode Extensions

**[Ubuntu Desktop Install](../../ubuntu22-04/desktop-install.md)**\
**[Setup Development System](../../../development/report_system/setup_dev_system/setup_dev_system.md)**\
**[Current Status](../../../development/status/weekly/current_status.md)**\
**[Back to Main](../../../README.md)**

## How to install extensions

Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter.

## Markdown

- **[Back and Forth](https://marketplace.visualstudio.com/items?itemName=nick-rudenko.back-n-forth)**\
```ext install nick-rudenko.back-n-forth```
- **[Markdown Lint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)**\
```ext install DavidAnson.vscode-markdownlint```\

    **[configure format on save setting](https://code.visualstudio.com/docs/getstarted/settings#_language-specific-editor-settings)**

    VS Code provides different scopes for settings:

    User settings - Settings that apply globally to any instance of VS Code you open.\
    Workspace settings - Settings stored inside your workspace and only apply when the workspace is opened.

    To automatically format when saving or pasting into a Markdown document, configure Visual Studio Code's editor.formatOnSave or editor.formatOnPaste settings like so:\
    User Settings\
    editor.format On Save: checked\
    editor.format On Save Mode: file\
    Workspace Settings\
    "[markdown]": {
        "editor.formatOnSave": true,
        "editor.formatOnPaste": true
    },

- **[Markdown PDF](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf)**\
```ext install yzane.markdown-pdf```
- **[Markdown Preview Mermaid](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)**\
```ext install bierner.markdown-mermaid```
- **[Mermaid Markdown Syntax Highlighting](https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting)**\
```ext install bpruitt-goddard.mermaid-markdown-syntax-highlighting```
