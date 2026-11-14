# Nushell cannot source zsh startup scripts (Oh My Zsh, nvm.sh, or bash completion).
$env.EDITOR = 'nvim'
$env.K9S_EDITOR = 'nvim'
$env.OPENCODE_EXPERIMENTAL_BACKGROUND_SUBAGENTS = 'true'
$env.OPENCODE_ENABLE_EXA = '1'
$env.NVM_DIR = ($env.HOME | path join '.nvm')
$env.PATH = ($env.PATH | append ($env.HOME | path join 'go/bin'))
let opencode_bin = ($env.HOME | path join '.opencode/bin')
if ($opencode_bin | path exists) and ($opencode_bin not-in $env.PATH) {
    $env.PATH = ($env.PATH | append $opencode_bin)
}
if $nu.os-info.name == 'macos' {
    let prefixes = if $nu.os-info.arch == 'aarch64' {
        ['/opt/homebrew' '/usr/local']
    } else {
        ['/usr/local' '/opt/homebrew']
    }
    for prefix in $prefixes {
        let brew_bin = ($prefix | path join 'bin')
        if ($brew_bin | path exists) {
            for directory in [$brew_bin ($prefix | path join 'sbin')] {
                if $directory not-in $env.PATH {
                    $env.PATH = ($env.PATH | append $directory)
                }
            }
        }
    }
}
let snap_bin = '/var/lib/snapd/snap/bin'
if $nu.os-info.name == 'linux' and ($snap_bin | path exists) and ($snap_bin not-in $env.PATH) {
    $env.PATH = ($env.PATH | append $snap_bin)
}

# ~/.env contains shell syntax and possibly secrets: do not evaluate it as Nu.
# Export any required values explicitly or use a trusted Nushell-only secrets loader.

# zoxide's generated hook expects a boolean, not an inherited shell string.
if '__zoxide_hooked' in $env { hide-env __zoxide_hooked }

# Generate the script before config.nu is loaded.
zoxide init --cmd cd nushell | save -f ~/.zoxide.nu
