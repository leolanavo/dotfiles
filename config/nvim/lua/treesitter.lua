local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {"typescript", "javascript", "python", "svelte", "java"},
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  }
}
