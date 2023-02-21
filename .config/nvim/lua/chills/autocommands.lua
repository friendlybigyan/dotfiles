vim.cmd([[
  hi NormalFloat guibg=NONE
  hi Title guibg=NONE guifg=#cc9b9d
  hi FloatBorder guibg=NONE
  hi BufferTabpageFill guibg=NONE
  hi TabLineFill guibg=NONE
  hi TabLine guibg=NONE
  hi TelescopeNormal guibg=NONE guifg=NONE
  hi TelescopeBorder guibg=NONE guifg=NONE
  
  
  highlight! DiagnosticLineNrError guibg=#B7435E guifg=#cc9b9d gui=bold
  highlight! DiagnosticLineNrWarn guibg=#D88B72 guifg=#E8CCA7 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#6E7EBF guifg=#B8C9EA gui=bold
  highlight! DiagnosticLineNrHint guibg=#414560 guifg=#63718B gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint

  hi DiagnosticError  guifg=#cc9b9d gui=bold
  hi DiagnosticWarn  guifg=#E8CCA7 gui=bold
  hi DiagnosticInfo  guifg=#B8C9EA gui=bold
  hi DiagnosticHint  guifg=#63718B gui=bold

  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080

  highlight! CmpItemAbbrMatch guibg=NONE guifg=#CCCBD9
  highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch

  highlight! CmpItemKindVariable guibg=NONE guifg=#95C2D1
  highlight! link CmpItemKindInterface CmpItemKindVariable
  highlight! link CmpItemKindText CmpItemKindVariable

  highlight! CmpItemKindFunction guibg=NONE guifg=#f6bbe7
  highlight! link CmpItemKindMethod CmpItemKindFunction

  highlight! CmpItemKindKeyword guibg=NONE guifg=#caf6bb
  highlight! link CmpItemKindProperty CmpItemKindKeyword
  highlight! link CmpItemKindUnit CmpItemKindKeyword

  highlight! CmpItemMenu guibg=NONE guifg=#63718B

  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
  
  ]])
