local telescope = require 'telescope'

telescope.setup{
  defaults = {
    color_devicons = true,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    layout_strategy = "flex",

    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

telescope.load_extension('fzy_native')
