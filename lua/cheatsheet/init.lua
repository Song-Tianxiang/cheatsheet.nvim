local config = {
	mappings = {
		general = {
			n = {
				["<leader>ch"] = { "<cmd> Cheatsheet <CR>", "Mapping cheatsheet" },
			},
		},
	},
	opt = {
		theme = "simple",
	},
}

local M = {}

M.config = config

M.setup = function(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.toggle = function()
	if vim.g.nvcheatsheet_displayed then
		require("cheatsheet.utils").close_buffer()
	else
		require("cheatsheet." .. M.config.opt.theme)
	end
end

return M
