function consolelog()
	-- Get the current buffer and cursor position
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = cursor[1]
	local col = cursor[2]

	-- Get the Treesitter parser for the buffer
	local parser = vim.treesitter.get_parser(bufnr, "javascript")
	-- Get the syntax tree for the buffer
	local tree = parser:parse()[1]
	-- Find the nearest variable declaration or assignment node
	local function findVariableNode(startNode)
		if not startNode then
			return nil
		end

		print(startNode)
		if startNode:type() == "variable_declaration" or startNode:type() == "assignment_expression" then
			return startNode
		end

		local parent = startNode:parent()
		if parent and parent ~= tree then
			return findVariableNode(parent)
		end
		return nil
	end

	-- Traverse the syntax tree from the root node
	local variableNode = findVariableNode(tree)

	if variableNode then
		-- Extract the variable name
		local variableName = variableNode:child(1):node_text()

		-- Generate the console log statement
		local consoleLog = string.format('console.log("%s:", %s)', variableName, variableName)

		-- Insert the console log statement on the next line
		vim.api.nvim_buf_set_lines(bufnr, line, line + 1, false, { consoleLog, "" })
		vim.api.nvim_win_set_cursor(0, { line + 1, 0 })
	else
		print("No variable found under the cursor.")
	end
end
