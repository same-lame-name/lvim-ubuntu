lvim.builtin.which_key.mappings["t"] = {
  name = "Terminal",
  f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
  h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
  v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
}

local disabled_which_keys = { "g" } --{ "g", "d", "T", "l", "L" }

for _, d in ipairs(disabled_which_keys) do
  lvim.builtin.which_key.mappings[d] = {}
end

lvim.builtin.which_key.mappings["x"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["c"] = {
  name = "Competitive Setup",

  c = { "<cmd>lua _COMPILE()<cr>", "Compile" },
  s = { "<cmd>lua _START_COMP_SESSION()<cr>", "Start session" },
  l = { "<cmd>lua _COMPETITIVE_LAYOUT()<cr>", "Competitive Layout" },
  r = { "<cmd>lua _RUN()<cr>", "Run" },
  t = { "<cmd>lua _GET_AND_RUN()<cr>", "Paste test case and Run" },
  e = { "<cmd>lua _END_COMP_SESSION()<cr>", "End session" },

  C = {
    name = "Compile and then",
    r = { "<cmd>lua _COMPILE_AND_RUN()<cr>", "Compile & Run" },
    d = { "<cmd>lua _COMPILE_WITH_FLAG()<cr>", "Compile with debug" }
  }

}
