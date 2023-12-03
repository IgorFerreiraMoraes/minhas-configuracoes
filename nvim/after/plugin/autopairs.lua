local auto_pairs = require("nvim-autopairs")

auto_pairs.setup {
    check_ts = true,
    ts_config = {
        javascript = { 'string', 'template_string' },
        vue = { 'string', 'template_string' }
    },
    disable_filetype = { "TelescopePrompt" },
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

