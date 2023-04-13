local options = {
	backup = false, -- creates a backup file.
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard.
	cmdheight = 2, -- more space in the neovim command line for displaying messages, value >1 avoids Hit-Enter prompts.
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp, menuone will show pop suggestion even if there is single match, noselect will have no primary selection made amongst all possible matches.
	conceallevel = 0, -- so that `` is visible in markdown files.
	fileencoding = "utf-8", -- the encoding written to a file.
	hlsearch = true, -- highlight all matches on previous search pattern.
	ignorecase = true, -- ignore case in search patterns.
	mouse = "a", -- allow the mouse to be used in neovim.
	pumheight = 10, -- pop up menu height.
	showmode = false, -- -- INSERT --, -- VISUAL --, -- REPLACE -- Mode message on the last line.
	showtabline = 2, -- always show tabs.
	smartcase = true, -- smart case.
	smartindent = true, -- make indenting smarter again.
	splitbelow = true, -- force all horizontal splits to go below current window.
	splitright = true, -- force all vertical splits to go to the right of current window.
	swapfile = false, -- creates a swapfile.
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds); global option, applied at invocation, timeout within which we have to enter the next key command.
	undofile = true, -- enable persistent undo.
	updatetime = 300, -- faster completion (4000ms default), if nothing is typed for this long, swap file is written to disk.
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited.
	expandtab = true, -- convert tabs to spaces, Ctrl-V<Tab> to insert a real tab. Set it in case of setting customizing shiftwidth & tabstop.
	shiftwidth = 4, -- the number of spaces inserted for each indentation.
	tabstop = 4, -- insert 4 spaces for a tab.
	cursorline = true, -- highlight the current line.
	number = true, -- set numbered lines.
	relativenumber = true, -- set relative numbered lines.
	numberwidth = 4, -- set number column width to 4 {default 4}; minimum width, column is expanded to accomodate larger numbers.
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time.
	wrap = false, -- display lines as one long line.
	linebreak = true, -- companion to wrap, don't split words.
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`.
	-- guifont = "monospace:h17", -- the font used in graphical neovim applications.
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line.
	list = true, -- Set to enable appending to listchars to be displayed in editor
	autoread = true, -- Auto-load the changes in file done by some other application. Along with autocmd which checks on-focus along with others.
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. NOTE: last time I checked formatoption gets overwritten by ft(filetype)plugin in neo-runtime. May need to resort to BufEnter sort of hacks to get it working.

-- vim.opt.listchars:append "space:⋅" -- To view space character as '⋅' in the editor.
-- vim.opt.listchars:append "space:" -- To view space character as '' in the editor.
-- vim.opt.listchars:append "eol:↴" -- To view eol as '↴' in the editor.
vim.opt.listchars:append("eol:↲") -- To view eol as '↲' in the editor.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
