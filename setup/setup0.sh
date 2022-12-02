sudo pacman -Syyuu git base-devel go rustup

rustup default stable

cd ~/n
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg
