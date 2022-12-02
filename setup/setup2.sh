mkdir ~/.config/
mkdir ~/.config/awesome ~/.config/kitty ~/.config/nvim ~/.config/fish/ ~/.config/fish/functions/
cp ~/g/conf/rc.lua ~/g/conf/theme.lua ~/.config/awesome/
cp -r ~/g/conf/nvim ~/.config/
cp ~/g/conf/kitty.conf ~/.config/kitty/
cp ~/g/conf/*.fish ~/.config/fish/functions/

cd ~/.config/awesome/
git clone https://github.com/streetturtle/awesome-wm-widgets
curl "https://raw.githubusercontent.com/rxi/json.lua/master/json.lua" -o json.lua

chsh -s /usr/bin/fish
