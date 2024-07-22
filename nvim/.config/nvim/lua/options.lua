require "nvchad.options"

-- add yours here!

-- local o = vim.o
vim.opt.wrap = false
vim.api.nvim_create_user_command(
    'Count',
    function(opts)
        local search_term = opts.args
        local count = 0
        local buffer = vim.api.nvim_get_current_buf()
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local num_lines = #lines
        for _, line in ipairs(lines) do
            count = count + select(2, string.gsub(line, search_term, ""))
        end
        print(string.format("%s appears %d times in the buffer (buffer has %d lines).", search_term, count, num_lines))
    end,
    { nargs = 1 }
)
