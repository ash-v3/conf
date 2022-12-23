if status is-interactive
    # Commands to run in interactive sessions can go here
    alias cmus='tmux new-session -A -D -s cmus "$(which --skip-alias cmus)"'
    # bind -f common q shell tmux detach-client -s cmus

    set -Ux RUST_BACKTRACE 1
    set -Ux RUSTC_WRAPPER sccache
end
