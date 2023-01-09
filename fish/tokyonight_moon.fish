    # TokyoNight Color Palette
    set -l foreground c8d3f5
    set -l selection 3654a7
    set -l comment 7a88cf
    set -l red ff757f
    set -l orange ff966c
    set -l yellow ffc777
    set -l green c3e88d
    set -l purple fca7ea
    set -l cyan 86e1fc
    set -l pink c099ff
    set -l blue 82aaff

    # Syntax Highlighting Colors
    set -Ux fish_color_normal $foreground
    set -Ux fish_color_command $cyan
    set -Ux fish_color_keyword $pink
    set -Ux fish_color_quote $yellow
    set -Ux fish_color_redirection $foreground
    set -Ux fish_color_end $orange
    set -Ux fish_color_error $red
    set -Ux fish_color_param $purple
    set -U fish_color_option $green
    set -Ux fish_color_comment $comment
    set -Ux fish_color_selection --background=$selection
    set -Ux fish_color_search_match --background=$selection
    set -Ux fish_color_operator $green
    set -Ux fish_color_escape $pink
    set -Ux fish_color_autosuggestion $comment
    set -U fish_color_valid_path $pink --underline
    set -U fish_color_cancel $red

    # Completion Pager Colors
    set -Ux fish_pager_color_progress $comment
    set -Ux fish_pager_color_prefix $cyan
    set -Ux fish_pager_color_completion $foreground
    set -Ux fish_pager_color_description $comment
    set -Ux fish_pager_color_selected_background --background=$selection

    # Prompt colors
    set -Ux fish_color_cwd $blue
    set -U fish_color_cwd_root $red
    set -U fish_color_user $blue
    set -U fish_color_host $green
