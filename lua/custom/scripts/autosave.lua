local run_rubocop = function()
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('BeforeSavingRubyFiles', { clear = true }),
    pattern = '*.rb',
    callback = function()
      vim.fn.jobstart({ '/Users/dansouza/dev/catalyst/pre-commit.sh' }, {
        -- on_stdout = function(_, data)
        -- print 'Rubocop: all good'
        -- end,
        -- on_stderr = function(_, data)
        --   if data then
        --     print(vim.inspect(data))
        --     print 'Rubocop found errors'
        --   end
        -- end,
        on_exit = function(_, data)
          if data then
            print(vim.inspect(data))
          end
        end,
      })
    end,
  })
end

vim.api.nvim_create_user_command('RunRubocop', function()
  run_rubocop()
end, {})
