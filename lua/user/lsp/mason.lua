local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

lspconfig.elixirls.setup{
  cmd = { "/home/he9lin/.elixir-ls/release/language_server.sh" },
  on_attach = require("user.lsp.handlers").on_attach
}

lspconfig.lua_ls.setup{
  cmd = { "/home/he9lin/.lua-ls/bin/lua-language-server" };
}
