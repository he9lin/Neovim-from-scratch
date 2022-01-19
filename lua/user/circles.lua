local status_ok, circles = pcall(require, "circles")
if not status_ok then
	return
end

circles.setup({
  require("circles").setup({
    icons = {
      empty = "",
      filled = "",
      lsp_prefix = ""
    },
    -- override lsp_diagnostic virtual-text icon with `icons.lsp_prefix`
    -- lsp = true
  })
})
