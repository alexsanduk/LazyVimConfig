-- bootstrap lazy.nvim, LazyVim and your plugins

vim.g.python3_host_prog = os.getenv("NEOVIM_PYTHON_EXEC")
require("config.lazy")
