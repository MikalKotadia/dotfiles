# Dotfiles

## Neovim dependencies

Install the Tree-sitter CLI and the Mermaid diagram renderer (`bm`):

```sh
npm install -g tree-sitter-cli beautiful-mermaid-cli
```

The Neovim config uses `render-markdown.nvim` and `render-markdown-mermaid.nvim` to display Markdown and Mermaid flowcharts inline. After installing plugins with `:Lazy install`, check the setup with `:checkhealth render-markdown-mermaid`.
