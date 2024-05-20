return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "haringsrob/nvim_context_vt",
    opts = {
      disable_ft = { "json", "yaml", "xml" },
      disable_virtual_lines = true,
      custom_parser = function(node, ft, _)
        local utils = require("nvim_context_vt.utils")

        if node:end_() - node:start() < 10 then
          return nil
        end

        if ft == "lua" and node:type() == "if_statement" then
          return nil
        end

        if not utils.get_node_text(node)[1]:match("%w") then
          return nil
        end

        return "▶ " .. utils.get_node_text(node)[1]:gsub("{", "")
      end,
    },
    event = "VeryLazy",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {},
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "bibtex", "latex" })
      end

      if type(opts.highlight.disable) == "table" then
        vim.list_extend(opts.highlight.disable, { "latex" })
      else
        opts.highlight.disable = { "latex" }
      end

      opts.autotag = { enable = true }
      opts.matchup = {
        enable = true,
        disable = { "c", "cpp" },
        enable_quotes = true,
      }
      opts.playground = {
        enable = true,
        persist_queries = true,
      }
      opts.query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      }
    end,
  },

  { "windwp/nvim-ts-autotag", opts = {}, event = "InsertEnter" },
}
