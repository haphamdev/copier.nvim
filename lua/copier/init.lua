local module = {}

--[[
-- Normally, people use string:gmatch('[^\r\n]+') to split a multi-line string into a list of lines
-- However, this approach does not keep the empty lines
-- Therefore, this function is needed
--]]
local function split(self, delimiter)
	local result = {}
	local from = 1
	local delim_from, delim_to = string.find(self, delimiter, from)
	while delim_from do
		table.insert(result, string.sub(self, from, delim_from - 1))
		from = delim_to + 1
		delim_from, delim_to = string.find(self, delimiter, from)
	end
	table.insert(result, string.sub(self, from))
	return result
end

local function map(mode, lhs, rhs, opts)
	local options = { remap = false, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

function module.setup()
	require("yop").op_map({ "n", "v" }, "cp", function(lines)
		if #lines == 1 then
			lines = lines[1]
		end
		vim.fn.setreg("*", lines)
	end)

	require("yop").op_map({ "n", "v" }, "cv", function()
		local toBePasted = vim.fn.getreg("*")
		return split(toBePasted, "\n")
	end)

	map("n", "cV", '"*p')
	map("n", "cP", 'V"*y')
end

return module
