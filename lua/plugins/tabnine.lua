return {
  { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
  {
    "nvim-cmp",
    optional = true,
    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = function()
          if vim.fn.has("win32") == 1 then
            vim.cmd("!pwsh -noni .\\install.ps1")
          else
            vim.cmd("!./install.sh")
          end
          vim.cmd(":CmpTabnineHub")
        end,
        dependencies = "hrsh7th/nvim-cmp",
        opts = {
          max_lines = 1000,
          max_num_results = 3,
          sort = true,
        },
        config = function(_, opts)
          require("cmp_tabnine.config"):setup(opts)
        end,
      },
    },
    opts = function(_, opts)
      -- Initialiser opts.sources s'il est nil
      opts.sources = opts.sources or {}
      table.insert(opts.sources, 1, {
        name = "cmp_tabnine",
        group_index = 1,
        priority = 100,
      })

      opts.formatting = opts.formatting or {}
      opts.formatting.format = function(entry, item)
        if entry.source.name == "cmp_tabnine" then
          item.menu = ""
        end
        return item
      end
    end,
  },
}

