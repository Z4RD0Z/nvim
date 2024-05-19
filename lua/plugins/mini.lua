Config.statusline_opts = function()
  local MiniStatusline = require("mini.statusline")
  local _, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  local git = MiniStatusline.section_git({ trunc_width = 75, icon = "" })
  local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75, icon = "" })
  local filename = MiniStatusline.section_filename({ trunc_width = 140 })
  local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
  -- local location = MiniStatusline.section_location({ trunc_width = 75 })
  local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

  return MiniStatusline.combine_groups({
    -- { hl = mode_hl, strings = { mode } },
    { hl = mode_hl, strings = { git } },
    { hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
    "%<", -- Mark general truncate point
    { hl = "MiniStatuslineFilename", strings = { filename } },
    "%=", -- End left alignment
    "[%n]",
    { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
    { hl = mode_hl, strings = { search } },
    "%P",
  })
end

return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.completion").setup()
      require("mini.indentscope").setup()
      require("mini.cursorword").setup()
      require("mini.comment").setup()
      require("mini.trailspace").setup()
      require("mini.extra").setup()
      require("mini.animate").setup({ scroll = { enable = false } })
      -- require("mini.hues").setup({ background = "#002734", foreground = "#c0c8cc" }) -- azure

      require("mini.statusline").setup({
        content = {
          active = Config.statusline_opts,
          inactive = Config.statusline_opts,
        },
        use_icons = true,
      })

      require("mini.notify").setup({
        lsp_progress = {
          enable = true,
          duration_last = 1000,
        },
      })

      local hipatterns = require("mini.hipatterns")
      local hi_words = MiniExtra.gen_highlighter.words
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
          hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
          todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
          note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

          -- Highlight hex color strings (`#008080`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}