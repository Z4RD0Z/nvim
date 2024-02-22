local M = {}

M.diagnostics_signs = {
  Error = "✗ ",
  Warn = "! ",
  Hint = "➜ ",
  Info = "# ",
}

M.mason_signs = {
  Done = "✓",
  Pending = "➜",
  Failed = "✗",
}

M.ensure_installed_hl = {
  "markdown",
  "tsx",
  "typescript",
  "javascript",
  "toml",
  "json",
  "yaml",
  "rust",
  "css",
  "lua",
  "php",
  "go",
  "bash",
}

M.ensure_installed_lsp = {
  "css-lsp",
  -- "phpstan",
  -- "eslint_d",
  -- "gopls",
  -- "html-lsp",
  -- "json-lsp",
  -- "yaml-language-server",
  "lua-language-server",
  "prettier",
  "prettierd",
  "pyright",
  "stylua",
  "typescript-language-server",
  "intelephense",
  "vue-language-server",
  -- "rust-analyzer",
}

function M.remap_opt(desc, silent)
  local bufopts = {
    noremap = true,
    silent = silent,
    desc = desc,
  }
  return bufopts
end

return M
