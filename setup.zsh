systemctl enable dhcpcd
systemctl start dhcpcd

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup
rankmirrors -n 6 /etc/pacman.d/mirrorlist-backup > /etc/pacman.d/mirrorlist

pacman -Syu
pacman -S sudo openssh git

pacman -S base-devel go
mkdir /tmp/aur
cd /tmp/aur

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg
pacman -U *

# install packages
yay -Syyuu vicious ttf-jetbrains-mono bottom firefox alsa alsa-utils base brave-bin feh firefox kitty neovim visual-studio-code-bin github-cli ranger neofetch gnuplot wttr fish dmenu chromium ag fasd htop colordiff feh ncdu pydf dtrx steam wine-ge-custom discord steam arandr atop dkms etckeeper gimp macchanger reflector unrar zoxide tor nyx calibre

systemctl enable tor.service

# awesome config
mkdir ~/.config/awesome/
cp -r /etc/xdg/awesome/rc.lua ~/.config/awesome/
mkdir ~/.config/awesome/themes
cp -r /usr/share/awesome/themes/default ~/.config/awesome/themes/default