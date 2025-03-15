if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx COLORTERM truecolor
set -gx EDITOR nvim
set -gx LANG en_GB.UTF-8
set -gx LC_ALL en_GB.UTF-8
set -gx VIRTUAL_ENV_DISABLE_PROMPT true
set -gx GOPATH $HOME/go
set -gx DOCKER_BUILDKIT 1
set -gx COMPOSE_DOCKER_CLI_BUILD 1
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_bind_mode insert

# Title options
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes

# Prompt options
set -g theme_display_ruby yes
set -g theme_display_virtualenv yes
set -g theme_display_vagrant no
set -g theme_display_vi yes
set -g theme_display_k8s_context no # yes
set -g theme_display_user yes
set -g theme_display_hostname yes
set -g theme_show_exit_status yes
set -g theme_git_worktree_support no
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_display_date yes
set -g theme_display_cmd_duration yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_color_scheme solarized-dark

bind -M insert \cg forget

bind \x7F 'backward-kill-bigword'

#bind \cw backward-kill-bigword
#bind \e\[3\;5~ kill-word
#bind \c] backward-kill-word
#bind \cH backward-kill-path-component
#bind \c? backward-kill-path-component

#if which asdf > /dev/null; status --is-interactive; and source (brew --prefix asdf)/asdf.fish; end
#if which direnv > /dev/null; direnv hook fish | source; end
#if which goenv > /dev/null; status --is-interactive; and source (goenv init -|psub); end
#if which rbenv > /dev/null; status --is-interactive; and source (rbenv init -|psub); end
#if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end
