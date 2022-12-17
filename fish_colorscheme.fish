set -l bg 1d2021
set -l red cc241d
set -l green b8bb26 #98971a
set -l yellow d79921
set -l blue 458588
set -l purple b16286
set -l aqua 689d6a
set -l gray a89984
set -l fg ebdbb2
set -l orange d65d0e
set -l brorange fe8019

# Colorscheme: Lava
set -U fish_color_normal $fg
set -U fish_color_command $brorange
set -U fish_color_quote $yellow
set -U fish_color_redirection $orange
set -U fish_color_end $blue
set -U fish_color_error $red
set -U fish_color_param $green
set -U fish_color_comment $aqua
set -U fish_color_match $fg
set -U fish_color_selection $bg --bold --background=brblack
set -U fish_color_search_match $yellow --background=brblack
set -U fish_color_history_current $fg --bold
set -U fish_color_operator $purple
set -U fish_color_escape $red
set -U fish_color_cwd $green
set -U fish_color_cwd_root $red
set -U fish_color_valid_path $yellow --underline
set -U fish_color_autosuggestion $gray
set -U fish_color_user $green
set -U fish_color_host $red
set -U fish_color_cancel $red
set -U fish_pager_color_prefix $blue --bold --underline
set -U fish_pager_color_progress $fg --background=cyan
set -U fish_pager_color_completion $gray
set -U fish_pager_color_description $yellow
set -U fish_pager_color_selected_background --background=brblack
set -U fish_pager_color_secondary_completion
set -U fish_pager_color_selected_description
set -U fish_pager_color_background
set -U fish_color_keyword $purple
set -U fish_pager_color_secondary_prefix
set -U fish_pager_color_secondary_background
set -U fish_color_host_remote
set -U fish_color_option $green
set -U fish_pager_color_selected_prefix
set -U fish_pager_color_selected_completion
set -U fish_pager_color_secondary_description
