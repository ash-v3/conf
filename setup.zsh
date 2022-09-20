sudo systemctl enable dhcpcd
sudo systemctl start dhcpcd

sudo pacman -Syu
sudo pacman -S sudo openssh git

sudo pacman -S base-devel go
sudo mkdir /tmp/aur
cd /tmp/aur

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg
sudo pacman -U *

# install packages
yay -Syyuu vicious ttf-jetbrains-mono bottom alsa alsa-utils base brave-bin feh kitty neovim visual-studio-code-bin github-cli ranger neofetch gnuplot wttr fish dmenu chromium ag fasd htop colordiff feh ncdu pydf dtrx wine-ge-custom discord steam arandr atop dkms gimp macchanger reflector unrar zoxide tor nyx calibre rustup nftables popsicle

sudo systemctl enable tor.service

# awesome config
sudo mkdir ~/.config/awesome/
sudo cp -r /etc/xdg/awesome/rc.lua ~/.config/awesome/
sudo mkdir ~/.config/awesome/themes
sudo cp -r /usr/share/awesome/themes/default ~/.config/awesome/themes/default

sudo chsh -s /usr/bin/fish

sudo sysctl net.ipv4.tcp_ecn=0

sudo systemctl enable nftables.service

# change /etc/makepkg.conf & /etc/pacman.conf
sudo nvim /etc/makepkg.conf
sudo nvim /etc/pacman.conf