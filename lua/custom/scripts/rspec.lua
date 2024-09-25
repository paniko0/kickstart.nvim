function testEntireSpec()
  -- Get the current working directory
  local pwd = vim.fn.trim(vim.fn.execute 'pwd')

  -- Get the current file path without extension
  local path = vim.fn.expand '%:r'

  -- Replace 'app' with 'spec' and remove the current working directory from the path
  path = path:gsub('^app', 'spec')
  path = path:gsub('^' .. pwd .. '/', '')

  -- Check if the path ends with 'spec'
  if path:sub(-4) == 'spec' then
    path = path .. '.rb'
  else
    path = path .. '_spec.rb'
  end

  -- Print the command to be executed
  -- print(path)

  -- Send the command to the tmux session
  vim.api.nvim_command('silent! !/Users/dansouza/dev/rspec_in_tmux.sh ' .. path)
  -- vim.cmd('silent! /Users/dansouza/dev/rspec_in_tmux.sh ' .. path)
end

function testLineInSpec()
  -- Get the current file path without extension
  local path = vim.fn.expand '%:r'

  -- Replace 'app' with 'spec'
  path = path:gsub('^app', 'spec')

  -- Get the current line number
  local lineno = vim.fn.line '.'

  -- Check if the path ends with 'spec'
  if path:sub(-4) == 'spec' then
    path = path .. '.rb:' .. lineno
  else
    path = path .. '_spec.rb:' .. lineno
  end

  -- print(path)

  -- Send the command to the tmux session
  vim.cmd('silent! !/Users/dansouza/dev/rspec_in_tmux.sh ' .. path)
end

function openAssociatedSpec()
  -- Get the current working directory
  local pwd = vim.fn.trim(vim.fn.execute 'pwd')

  -- Get the current file path without extension
  local path = vim.fn.expand '%:r'

  if path:sub(-4) == 'spec' then
    path = path:gsub('^spec', 'app')
    path = path:gsub('_spec', '')
    path = path .. '.rb'
  else
    -- Replace 'app' with 'spec' and remove the current working directory from the path
    path = path:gsub('^app', 'spec')
    path = path:gsub('^' .. pwd .. '/', '')

    if path:sub(-4) == 'spec' then
      path = path .. '.rb'
    else
      path = path .. '_spec.rb'
    end
  end

  vim.api.nvim_command('e ' .. path)
end
