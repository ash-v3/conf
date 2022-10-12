set -U fish_color_normal ffffff # default color
set -U fish_color_command 00ffff --italics --bold # commands like echo
set -U fish_color_keyword 00ff00 --bold # keywords like if - this falls back on the command color if unset
set -U fish_color_quote ffff00 --italics # quoted text like "abc"
set -U fish_color_redirection 00ff00 --underline # IO redirections like >/dev/null
set -U fish_color_end 00ff00 --bold # process separators like ; and &
set -U fish_color_error ff0000 --bold # syntax errors
set -U fish_color_param 007fff # ordinary command parameters
set -U fish_color_valid_path 00ff7f --underline # parameters that are filenames (if the file exists)
set -U fish_color_option 00ff00 --bold # options starting with “-”, up to the first “--” parameter
set -U fish_color_comment ffffff --italics #007fff # comments like ‘# important’
set -U fish_color_operator 00ff00 --bold # parameter expansion operators like * and ~
set -U fish_color_escape ff0000 --bold # character escapes like \n and \x70
set -U fish_color_autosuggestion ffffff --italics # autosuggestions (the proposed rest of a command)
set -U fish_color_cwd 00ff00 --bold --underline # the current working directory in the default prompt
set -U fish_color_cwd_root ff0000 --bold --underline # the current working directory in the default prompt for the root user
set -U fish_color_user 007fff # the username in the default prompt
set -U fish_color_host 00ffff # the hostname in the default prompt
set -U fish_color_host_remote 00ffff # the hostname in the default prompt for remote sessions (like ssh)
set -U fish_color_status ff0000 --bold # the last command’s nonzero exit code in the default prompt
set -U fish_color_cancel ff0000 --bold # the ‘^C’ indicator on a canceled command
set -U fish_color_search_match ffffff # history search matches and selected pager items (background only)