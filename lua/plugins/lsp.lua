return {
  { "neovim/nvim-lspconfig" }, -- Plugin chính quản lý LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },  -- Autocompletion
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },   -- Snippet engine

  config = function()
    -- Khởi động Mason
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "tsserver" }, -- Cài đặt LSP tự động
    })

    -- Cấu hình LSP
    local lspconfig = require("lspconfig")

    -- Khả năng hỗ trợ của LSP cho nvim-cmp (autocomplete)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Thiết lập từng LSP Server
    local servers = { "lua_ls", "pyright", "tsserver" }

    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end

    -- Keymaps cho LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })

    -- Cấu hình autocomplete
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }),
    })
  end,
}
