# Catppuccin Mocha colors
local blue="#89b4fa"
local mauve="#cba6f7"
local green="#a6e3a1"
local text="#cdd6f4"
local red="#f38ba8"

# Git prompt settings
ZSH_THEME_GIT_PROMPT_PREFIX="%F{$green}  "
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{$red}●%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Clean minimal prompt: directory + git + $
PROMPT='%F{$blue}%2~%f$(git_prompt_info) %F{$blue}$%f '
