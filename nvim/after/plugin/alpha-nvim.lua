local status_dashboard, dashboard = pcall(require, "alpha.themes.dashboard")
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end


dashboard.section.header.val = {
  [[                                                         ]],
  [[                                                         ]],
  [[                                                         ]],
  [[                                   __                    ]],
  [[      ___     ___    ___   __  __ /\_\    ___ ___        ]],
  [[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\      ]],
  [[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \     ]],
  [[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\    ]],
  [[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/    ]],
  [[                                                         ]],
  [[                                                         ]],
  [[                                                         ]],
  [[                                                         ]],
}


-- local config = require("alpha.themes.theta").config
-- config.layout[2] = header_color()
-- alpha.setup(config)

dashboard.section.buttons.val = {
	dashboard.button("n", "   New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "   Find File", "<Cmd>Telescope find_files<CR>"),
	dashboard.button("r", "   Recent File", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "   Settings", ":e $HOME/.config/nvim/init.lua<CR>"),
	dashboard.button("q", "   Quit HUNG's NEOVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
vim.api.nvim_set_keymap('n', '<c-n>', ":Alpha<cr>", { noremap = true });
