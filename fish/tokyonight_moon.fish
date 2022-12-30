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

    # Syntax Highlighting Colors
    set -Ux fish_color_normal $foreground
    set -Ux fish_color_command $cyan
    set -Ux fish_color_keyword $pink
    set -Ux fish_color_quote $yellow
    set -Ux fish_color_redirection $foreground
    set -Ux fish_color_end $orange
    set -Ux fish_color_error $red
    set -Ux fish_color_param $purple
    set -Ux fish_color_comment $comment
    set -Ux fish_color_selection --background=$selection
    set -Ux fish_color_search_match --background=$selection
    set -Ux fish_color_operator $green
    set -Ux fish_color_escape $pink
    set -Ux fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -Ux fish_pager_color_progress $comment
    set -Ux fish_pager_color_prefix $cyan
    set -Ux fish_pager_color_completion $foreground
    set -Ux fish_pager_color_description $comment
    set -Ux fish_pager_color_selected_background --background=$selection

  
