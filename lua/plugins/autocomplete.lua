return {
  -- Plugin de complétion principale
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",       -- Support de LSP
      "hrsh7th/cmp-buffer",         -- Complétion pour le buffer actuel
      "hrsh7th/cmp-path",           -- Complétion pour les chemins de fichiers
      "saadparwaiz1/cmp_luasnip",   -- Intégration avec LuaSnip
      },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirme la complétion avec "Entrée"
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
        },
        formatting = {
          format = function(entry, vim_item)
            if entry.source.name == "cmp_tabnine" then
              vim_item.kind = " [TabNine]"
            end
            return vim_item
          end,
        },
      })
    end,
  },
  -- Plugin pour les snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Snippets préconfigurés
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}

