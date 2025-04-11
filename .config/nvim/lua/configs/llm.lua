local M = {}

M.gemini = {
  provider = "gemini",
  behaviour = {
    auto_suggestions = true,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
  },
  gemini = {
    model = "gemini-2.0-flash",
    temperature = 0,
    max_tokens = 4096,
  },
}

return M
