vim.cmd[[
highlight NotifyERRORBorder guifg=#B7435E
highlight NotifyWARNBorder guifg=#D88B72
highlight NotifyINFOBorder guifg=#7e8f80
highlight NotifyDEBUGBorder guifg=#CCCBD9
highlight NotifyTRACEBorder guifg=#414560
highlight NotifyERRORIcon guifg=#B7435E
highlight NotifyWARNIcon guifg=#D88B72
highlight NotifyINFOIcon guifg=#caf6bb
highlight NotifyDEBUGIcon guifg=#CCCBD9
highlight NotifyTRACEIcon guifg=#8787BF
highlight NotifyERRORTitle  guifg=#B7435E
highlight NotifyWARNTitle guifg=#D88B72
highlight NotifyINFOTitle guifg=#caf6bb
highlight NotifyDEBUGTitle  guifg=#CCCBD9
highlight NotifyTRACETitle  guifg=#8787BF
highlight link NotifyERRORBody Normal
highlight link NotifyWARNBody Normal
highlight link NotifyINFOBody Normal
highlight link NotifyDEBUGBody Normal
highlight link NotifyTRACEBody Normal
]]

require("notify").setup({
  background_colour = "#000000",
  render = "compact",
  animation_style = "fade_in_slide_out",
  minimum_width = 20,
  timeout = 3000,
  fps = 60,
  top_down = true
})
