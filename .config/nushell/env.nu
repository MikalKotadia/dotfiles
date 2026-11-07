# Nushell cannot source zsh startup scripts (Oh My Zsh, nvm.sh, or bash completion).
$env.EDITOR = 'nvim'
$env.K9S_EDITOR = 'nvim'
$env.OPENCODE_EXPERIMENTAL_BACKGROUND_SUBAGENTS = 'true'
$env.OPENCODE_ENABLE_EXA = '1'
$env.NVM_DIR = ($env.HOME | path join '.nvm')
$env.PATH = ($env.PATH | append ($env.HOME | path join 'go/bin'))

# ~/.env contains shell syntax and possibly secrets: do not evaluate it as Nu.
# Export any required values explicitly or use a trusted Nushell-only secrets loader.

# Generate the script before config.nu is loaded.
zoxide init nushell | save -f ~/.zoxide.nu
