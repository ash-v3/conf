set -U black 000000
set -U red ff0000
set -U green 00ff00
set -U yellow ffff00
set -U blue 0000ff
set -U magenta ff00ff
set -U cyan 00ffff
set -U white ffffff

set -l c_1 00ffff
set -l c_2 00ff80
set -l c_3 00ff40
set -l c_4 00ff00

set -U fish_color_normal white # default color
set -U fish_color_command $c_1 --italics --bold # commands like echo
set -U fish_color_keyword $c_1 --bold # keywords like if - this falls back on the command color if unset
set -U fish_color_quote $c_3 --italics # quoted text like "abc"
set -U fish_color_redirection $c_3 --underline # IO redirections like >/dev/null
set -U fish_color_end $c_1 --bold # process separators like ; and &
set -U fish_color_error red --bold --underline # syntax errors
set -U fish_color_param $c_2 # ordinary command parameters
set -U fish_color_valid_path $c_3 --underline # parameters that are filenames (if the file exists)
set -U fish_color_option $c_3 --bold # options starting with “-”, up to the first “--” parameter
set -U fish_color_comment white --italics #007fff # comments like ‘# important’
set -U fish_color_operator $c_1 --bold # parameter expansion operators like * and ~
set -U fish_color_escape red --bold # character escapes like \n and \x70
set -U fish_color_autosuggestion white --italics # autosuggestions (the proposed rest of a command)
set -U fish_color_cwd $c_2 --bold --underline # the current working directory in the default prompt
set -U fish_color_cwd_root $c_2 --bold --underline # the current working directory in the default prompt for the root user
set -U fish_color_user $c_4 # the username in the default prompt
set -U fish_color_host $c_4 # the hostname in the default prompt
set -U fish_color_host_remote $c_4 # the hostname in the default prompt for remote sessions (like ssh)
set -U fish_color_status red --bold --underline # the last command’s nonzero exit code in the default prompt
set -U fish_color_cancel red --bold # the ‘^C’ indicator on a canceled command
set -U fish_color_search_match white # history search matches and selected pager items (background only)
set -U color_vcs_prompt $c_4 --bold --underline # git color
set -U color_suffix $c_1 --bold --underline # suffix color
