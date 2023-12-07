-- main module file

---@class Config
---@field opt table Your config option
---@field opt.theme string , "grid" or "simple"
local config = {
	mappings = {
		general = {
			n = {
				["<leader>ch"] = { "<cmd> Cheatsheet <CR>", "Mapping cheatsheet" },
			},
		},
	},
	opt = {
		theme = "grid",
	},
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.toggle = function()
	if vim.g.nvcheatsheet_displayed then
		require("cheatsheet.utils").close_buffer()
	else
		require("cheatsheet." .. config.opt.theme)
	end
end

return M
