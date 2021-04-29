local lspconfig = require 'lspconfig'

-- Use ehanced LSP stuff
vim.lsp.handlers['textDocument/codeAction'] =
    require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] =
    require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] =
    require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] =
    require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] =
    require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] =
    require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] =
    require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] =
    require'lsputil.symbols'.workspace_handler
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {underline = true, virtual_text = false})

local on_attach = function(client, bufnr)
  local function set_keymap(type, keymap, value)
    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, type, keymap, value, opts)
  end

  -- Mappings.
  set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  set_keymap('n', '<space>rm', '<cmd>lua vim.lsp.buf.rename()<CR>')
  set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.references()<CR>')
  set_keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  set_keymap('n', '<space>i', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  end
end

lspconfig.tsserver.setup {
    root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
    on_attach = function(client, bufnr)
        -- This makes sure tsserver is not used for formatting (I prefer prettier)
        client.resolved_capabilities.document_formatting = false

        on_attach(client, bufnr)
    end,
    settings = {documentFormatting = false}
}

lspconfig.yamlls.setup{}

lspconfig.dockerls.setup{}


