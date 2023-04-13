local split_motion = vim.api.nvim_replace_termcodes("<C-w>", true, false, true)
local registers = {
  t = "$o\rint testcases;\rcin >> testcases;\r\rwhile(testcases--) {",
  m = ":18r ../../algorithms/modular_arithmetic.cpp\r",
  d = "2ggO#ifdef LOCAL\r#include \"../../algorithms/debug.cpp\"\r#else\r#define debug(...) \"\"\r#endifjj``"
}

local function esc(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local competitive_session = false

function _START_COMP_SESSION()
  if competitive_session then
    vim.notify("Session already in progress")
    return
  end

  competitive_session = true

  vim.cmd("cd ~/playground/contests/practice/")

  for k, v in pairs(registers) do
    vim.fn.setreg(k, v)
  end

  _TOGGLE_TEMPLATE_LOAD_AUTOCMD()
  vim.notify("Starting competitive session")
end

function _END_COMP_SESSION()
  if not competitive_session then
    vim.notify("Not in competitive session, ignoring request")
    return
  end

  competitive_session = false

  for k, _ in pairs(registers) do
    vim.fn.setreg(k, '')
  end

  _TOGGLE_TEMPLATE_LOAD_AUTOCMD()
  vim.cmd('only')
  vim.notify("Competitive session ended")
end

function _COMPETITIVE_LAYOUT()
  if not competitive_session then
    vim.notify("Not in competitive session, ignoring request")
    return
  end

  vim.cmd("vsplit input.txt")
  vim.cmd("split output.txt")
  vim.api.nvim_feedkeys(split_motion .. "h", "n", true)
end

function _GET_AND_RUN()
  if not competitive_session then
    vim.notify("Not in competitive session, ignoring request")
    return
  end

  vim.cmd(esc('normal <C-W><C-L><C-W><C-K>1GdG"+p:1,1g/^s*$/d<CR>:w<CR><C-W><C-H>'))
  _RUN()
end

function _COMPILE_AND_RUN()
  if not competitive_session then
    vim.notify("Not in competitive session, ignoring request")
    return
  end

  vim.cmd(esc("normal <F1>"))
end

function _COMPILE()
  if not competitive_session then
    vim.notify("Not in competitive session, ignoring request")
    return
  end

  vim.cmd(esc("normal <F2>"))
end

function _RUN()
  if not competitive_session then
    vim.notify("Not in competitive session, ignoring request")
    return
  end

  vim.cmd(esc("normal <F3>"))
end

function _COMPILE_WITH_FLAG()
  if not competitive_session then
    vim.notify("Not in competitive session, ignoring request")
    return
  end

  vim.cmd(esc("normal <F4>"))
end

function _TOGGLE_TEMPLATE_LOAD_AUTOCMD()
  if not competitive_session then
    vim.cmd(":autocmd! LoadCompTemplate")
    return
  end

  local load_template = vim.api.nvim_create_augroup("LoadCompTemplate", { clear = true })
  vim.api.nvim_create_autocmd("BufNewFile", {
    desc = "Load Competitive Programming Template",
    group = load_template,
    pattern = "*.cpp",
    command = ":0r ~/playground/templates/default.cpp",
  })
end
