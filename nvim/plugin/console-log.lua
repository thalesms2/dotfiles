-- 🔎 Como usar
-- Após adicionar o código acima e reiniciar o Neovim (ou :luafile % no buffer de config):
--
-- :ShowTable MinhaTabela
-- :ShowTable require("meu_modulo").variavel
-- Você pode passar qualquer expressão válida em Lua, e o conteúdo será aberto em um buffer legível.

local function open_buffer_with_table(table_data)
  local lines = vim.split(vim.inspect(table_data), "\n")

  vim.cmd("vnew")
  local buf = vim.api.nvim_get_current_buf()

  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  vim.bo[buf].modifiable = false
end

-- Cria o comando :ShowTable que recebe uma expressão Lua e exibe no buffer
vim.api.nvim_create_user_command("ShowTable", function(opts)
  local ok, result = pcall(load("return " .. opts.args))
  if not ok then
    vim.notify("Erro ao avaliar expressão: " .. result, vim.log.levels.ERROR)
    return
  end
  open_buffer_with_table(result)
end, {
  nargs = 1,
  complete = "expression",  -- autocomplete para variáveis/expressões
})

--  Como usar :ShowValue
-- :ShowValue "Olá mundo"
-- :ShowValue 42 * 2
-- :ShowValue require("meu_modulo").variavel
-- :ShowValue vim.api.nvim_list_bufs()
-- Aceita strings, números, tabelas, listas, chamadas de função, etc.

local function open_buffer_with_value(value)
  local content = vim.inspect(value)
  local lines = vim.split(content, "\n")

  vim.cmd("vnew")
  local buf = vim.api.nvim_get_current_buf()

  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  vim.bo[buf].modifiable = false
end

vim.api.nvim_create_user_command("ShowValue", function(opts)
  local ok, result = pcall(load("return " .. opts.args))
  if not ok then
    vim.notify("Erro ao avaliar expressão: " .. result, vim.log.levels.ERROR)
    return
  end
  open_buffer_with_value(result)
end, {
  nargs = 1,
  complete = "expression",
})
