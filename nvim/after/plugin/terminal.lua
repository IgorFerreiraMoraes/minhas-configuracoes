local toggleterm = require('toggleterm'),

    -- Windows Requirement
    vim.cmd("let &shell = has('win32') ? 'powershell' : 'pwsh'")
vim.cmd(
    "let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'")
vim.cmd("let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
vim.cmd("let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
vim.cmd("set shellquote= shellxquote=")
--

toggleterm.setup({
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    persist_size = true,
    close_on_exit = true,
    direction = 'float',
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal"
        }
    }
})

local Terminal = require('toggleterm.terminal').Terminal

