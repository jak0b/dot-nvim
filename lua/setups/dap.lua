local dap = require 'dap'
local dap_python = require 'dap-python'
local dap_virtual_text = require 'nvim-dap-virtual-text'

local dapui = require 'dapui'
local fn = vim.fn
local g = vim.g
local sg = vim.fn.sign_define

sg('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

--- Adapters

-- LLDP - C CPP Rust
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb',
}

dap.adapters.go = {
  type = 'executable',
  command = '/usr/bin/dlv',
}

--- Configurations

-- LLDB
local lldb = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}
-- C
dap.configurations.c = lldb
-- CPP
dap.configurations.cpp = lldb
-- Rust
dap.configurations.rust = lldb

-- Golang
dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    args = { 'dap', '-l', '127.0.0.1:' .. port },
    detached = true,
  }
  handle, pid_or_err = vim.loop.spawn('dlv', opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print('dlv exited with code', code)
    end
  end)
  assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require('dap.repl').append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(function()
    callback { type = 'server', host = '127.0.0.1', port = port }
  end, 100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug',
    request = 'launch',
    program = '${file}',
  },
  {
    type = 'go',
    name = 'Debug test', -- configuration for debugging test files
    request = 'launch',
    mode = 'test',
    program = '${file}',
  },
  -- works with go.mod packages and sub packages
  {
    type = 'go',
    name = 'Debug test (go.mod)',
    request = 'launch',
    mode = 'test',
    program = './${relativeFileDirname}',
  },
}

-- Enable virtual text - an extension that shows the current values of variables
-- in the debugged code
dap_virtual_text.setup {
  enabled = true, -- enable this plugin (the default)
  enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true, -- show stop reason when stopped for exceptions
  commented = false, -- prefix virtual text with comment string
  -- experimental features:
  virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

dap_python.setup '~/.virtualenvs/debugpy/bin/python'

--- DAP UI
dapui.setup {
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = 'scopes',
        size = 0.25, -- Can be float or integer > 1
      },
      { id = 'breakpoints', size = 0.25 },
      { id = 'stacks', size = 0.25 },
      { id = 'watches', size = 00.25 },
    },
    size = 40,
    position = 'left', -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { 'repl' },
    size = 10,
    position = 'bottom', -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
}
