local M = {}

local utils = require("n-utils.functions")
M.setup = function(opts)
  vim.api.nvim_create_user_command('Norminette42', 'lua Norminette42()', {})
  local myluafunc = function ()
    return utils.norminette42(opts.maxErrorsToShow)
  end
-- Check on buffer enter
  vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = { "*.c", "*.h" },
    callback = myluafunc
  })

-- Check on save
  if opts.runOnSave then
    vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = { "*.c", "*.h" },
    callback = myluafunc
  })
  end

-- Register user command
end

return M