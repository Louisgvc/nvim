require("config.lazy")
require("config.settings")

require("lazy").setup({
  { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
})
