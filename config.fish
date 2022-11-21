if status is-interactive
    # Commands to run in interactive sessions can go here
    alias cmus='screen -q -r -D cmus || screen -S cmus $(which --skip-alias cmus)'
end
