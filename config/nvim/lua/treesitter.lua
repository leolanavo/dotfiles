local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = "maintained",
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  }
}
