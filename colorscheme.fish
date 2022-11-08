set -U black 000000
set -U red ff0000
set -U green 00ff00
set -U yellow ffff00
set -U blue 0000ff
set -U magenta ff00ff
set -U cyan 00ffff
set -U white ffffff

# black
# red
set -U fish_color_error red --bold # syntax errors
set -U fish_color_escape red --bold # character escapes like \n and \x70
set -U fish_color_cwd_root red --bold # the current working directory in the default prompt for the root user
set -U fish_color_host red # the hostname in the default prompt
set -U fish_color_host_remote red # the hostname in the default prompt for remote sessions (like ssh)
set -U fish_color_status red --bold # the last command’s nonzero exit code in the default prompt
set -U fish_color_cancel red --bold # the ‘^C’ indicator on a canceled command
# green
set -U fish_color_valid_path green --bold --italics # parameters that are filenames (if the file exists)
set -U fish_color_cwd green --bold # the current working directory in the default prompt
set -U fish_color_redirection green --bold --italics # IO redirections like >/dev/null
set -U fish_color_option green --bold # options starting with “-”, up to the first “--” parameter
# yellow
set -U fish_color_quote yellow # quoted text like "abc"
# blue
set -U fish_color_param blue # ordinary command parameters
# magenta
set -U fish_color_keyword magenta --bold # keywords like if - this falls back on the command color if unset
set -U fish_color_operator magenta --bold # parameter expansion operators like * and ~
set -U fish_color_end magenta --bold # process separators like ; and &
# cyan
set -U fish_color_command cyan --bold # commands like echo
set -U fish_color_user cyan # the username in the default prompt
set -U color_suffix cyan --bold # suffix color
# white
set -U fish_color_normal white # default color
set -U fish_color_comment white --italics #007fff # comments like ‘# important’
set -U fish_color_autosuggestion white --italics # autosuggestions (the proposed rest of a command)
set -U fish_color_search_match white # history search matches and selected pager items (background only)
