local competitive_programming = vim.api.nvim_create_augroup("CompetitiveProgramming", { clear = true })
local auto_read_group = vim.api.nvim_create_augroup("AutoRead", { clear = true })

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	group = auto_read_group,
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- '%' gives the relative path of current file.
-- '%:r' gives the relative path of current file without extension.
-- '%:t:r' gives the tail path (file name) for current file without extension.
vim.api.nvim_create_autocmd("FileType", {
	desc = "Compile and Run",
	group = competitive_programming,
	pattern = "cpp",
	command = "nnoremap <F1> :w <bar> exec '!g++ '.shellescape('%').' -o ./bin/'.shellescape('%:t:r').' -D LOCAL -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result && ./bin/'.shellescape('%:t:r')<CR><CR>",
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Compile",
	group = competitive_programming,
	pattern = "cpp",
	command = "nnoremap <F2> :w <bar> exec '!g++ '.shellescape('%').' -o ./bin/'.shellescape('%:t:r').' -D LOCAL -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result'<CR><CR>",
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Run",
	group = competitive_programming,
	pattern = "cpp",
	command = "nnoremap <F3> :w <bar> exec '!./bin/'.shellescape('%:t:r') <CR><CR>",
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Compile with debug flags",
	group = competitive_programming,
	pattern = "cpp",
	command = "nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o ./bin/'.shellescape('%:t:r').' -D LOCAL -std=c++17 -Wshadow -Wall -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG'<CR><CR>",
})

