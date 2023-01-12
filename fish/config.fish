if status is-interactive
    # Commands to run in interactive sessions can go here
    alias cmus='tmux new-session -A -D -s cmus "$(which --skip-alias cmus)"'
    # bind -f common q shell tmux detach-client -s cmus

    set -Ux RUST_BACKTRACE 1
    set -Ux RUSTC_WRAPPER sccache
    set -Ux RUSTFLAGS "-Cinstrument-coverage"
    set -Ux LLVM_PROFILE_FILE "./target/.grcov/%p-%m.profraw"
    set -Ux FZF_DEFAULT_OPTS "\
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"    
    set -Ux WINEARCH win64
    set -Ux WINEPREFIX ~/.wine
end
