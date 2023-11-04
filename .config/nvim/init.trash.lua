  -- {
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     { 'williamboman/mason.nvim', config = true },
  --     'williamboman/mason-lspconfig.nvim',
  --
  --     { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
  --
  --     'folke/neodev.nvim',
  --   },
  -- },

  -- {
  --   'hrsh7th/nvim-cmp',
  --   dependencies = {
  --     'L3MON4D3/LuaSnip',
  --     'saadparwaiz1/cmp_luasnip',
  --
  --     'hrsh7th/cmp-nvim-lsp',
  --
  --     'rafamadriz/friendly-snippets',
  --   },
  -- },

  -- { 'folke/which-key.nvim', opts = {} },
  -- {
  --   'lewis6991/gitsigns.nvim',
  --   opts = {
  --     on_attach = function(bufnr)
  --       vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
  --       vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
  --       vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
  --     end,
  --   },
  -- },











-- -- $toggleterm setup
-- require('toggleterm').setup{
--   size = function(term)
--     if term.direction == 'horizontal' then
--       return 20
--     elseif term.direction == 'vertical' then
--       return vim.o.columns * 0.4
--     end
--   end,
--   open_mapping = [[<c-`>]],
--   hide_numbers = true,
--   autochdir = true,
--   terminal_mappings = true,
--   direction = 'float',
--   shell = vim.o.shell,
--   border = 'single'
-- }






-- -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- -- $servers for languages
-- local servers = {
--   lua_ls = {
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--     },
--   },
-- }
--
-- -- This function gets run when an LSP connects to a particular buffer.
-- local on_attach = function(_, bufnr)
--   local nmap = function(keys, func, desc)
--     if desc then
--       desc = 'LSP: ' .. desc
--     end
--
--     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--   end
--
--   nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--   nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--
--   nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--   nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--   nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--   nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
--   nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--   nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
--   nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--   nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
--   nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--   nmap('<leader>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, '[W]orkspace [L]ist Folders')
--
--   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--     vim.lsp.buf.format()
--   end, { desc = 'Format current buffer with LSP' })
-- end
-- local mason_lspconfig = require 'mason-lspconfig'
-- mason_lspconfig.setup {
--   ensure_installed = vim.tbl_keys(servers),
-- }
-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--     }
--   end,
-- }
--
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = false,
--     virtual_text = false,
--     signs = true,
--     update_in_insert = false,
--   }
-- )
--
-- -- $cmp completion settings
-- local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
-- require('luasnip.loaders.from_vscode').lazy_load()
-- luasnip.config.setup {}
--
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert {
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete {},
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = false,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_locally_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.locally_jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--   },
--   preselect = 'None',
-- })
--
-- local cmpenablepattern = { '*.lua', '*.py', '*.vim', }
-- local cmpdisablepattern = { '*.tex', '*.asy' }
--
-- vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
--   pattern = cmpenablepattern,
--   callback = function ()
--     require('cmp').setup.buffer{ enabled = true }
--   end
-- })
-- vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
--   pattern = cmpdisablepattern,
--   callback = function ()
--     require('cmp').setup.buffer{ enabled = false }
--   end
-- })






-- $fold settings
-- vim.o.foldenable = true
-- vim.o.foldmethod = 'manual'
-- local foldpattern = {'*.*'}
-- local savepath = '/home/ramak/.local/state/nvim/view/'
-- local foldgroup = vim.api.nvim_create_augroup('folds', { clear = true })
-- vim.api.nvim_create_autocmd({ 'BufWinLeave', 'BufLeave', 'BufDelete' }, {
--   pattern = foldpattern,
--   group = foldgroup,
--   command = 'mkview',
-- })
-- local loadfolds = true
-- vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
--   pattern = foldpattern,
--   group = foldgroup,
--   callback = function ()
--     if not loadfolds then
--       return
--     end
--     local svpath = vim.fn.expand('%:p')
--     svpath = string.gsub(svpath, '/home/ramak', '~')
--     svpath = savepath .. string.gsub(svpath, '/', '=+') .. '='
--     local svexists = io.open(svpath, 'r') ~= nil
--     if svexists then
--       vim.cmd('loadview')
--     end
--   end
-- })
