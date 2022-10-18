set -U black 000000
set -U red ff0000
set -U green 00ff00
set -U yellow ffff00
set -U blue 0000ff
set -U magenta ff00ff
set -U cyan 00ffff
set -U white ffffff

set -U fish_color_normal white # default color
set -U fish_color_command cyan --italics --bold # commands like echo
set -U fish_color_keyword green --bold # keywords like if - this falls back on the command color if unset
set -U fish_color_quote yellow --italics # quoted text like "abc"
set -U fish_color_redirection green --underline # IO redirections like >/dev/null
set -U fish_color_end red --bold # process separators like ; and &
set -U fish_color_error red --bold # syntax errors
set -U fish_color_param yellow # ordinary command parameters
set -U fish_color_valid_path green --underline # parameters that are filenames (if the file exists)
set -U fish_color_option green --bold # options starting with “-”, up to the first “--” parameter
set -U fish_color_comment white --italics #007fff # comments like ‘# important’
set -U fish_color_operator green --bold # parameter expansion operators like * and ~
set -U fish_color_escape red --bold # character escapes like \n and \x70
set -U fish_color_autosuggestion white --italics # autosuggestions (the proposed rest of a command)
set -U fish_color_cwd green --bold --underline # the current working directory in the default prompt
set -U fish_color_cwd_root red --bold --underline # the current working directory in the default prompt for the root user
set -U fish_color_user green # the username in the default prompt
set -U fish_color_host green # the hostname in the default prompt
set -U fish_color_host_remote green # the hostname in the default prompt for remote sessions (like ssh)
set -U fish_color_status red --bold # the last command’s nonzero exit code in the default prompt
set -U fish_color_cancel red --bold # the ‘^C’ indicator on a canceled command
set -U fish_color_search_match white # history search matches and selected pager items (background only)
