#!/bin/fish

paru -Syyu neovim firefox xclip arc-icon-theme ttf-jetbrains-mono \
	nerd-fonts-complete noto-fonts-emoji kitty fish lsd \
	github-cli discord bacon bat blanket \
	blender bottom broot codelldb-bin cointop \
	cudnn duf dust eslint fd \
	fish fzf gimp git-delta gitoxide \
	gnuplot gping heroic-games-launcher hexyl hyperfine \
	jdk libreoffice lua-language-server melody \
	onefetch p7zip pastel procs python \
	python-pip rate-mirrors ripgrep rust-analyzer \
	rustdesk-bin rustscan sc-im sd sherlock \
	steam stylua zoxide neovim-lspconfig vim-language-server \
	python-lsp-server wine-ge-custom winetricks lib32-nvidia-utils dkms \
	acpi acpid alsa-utils android-file-transfer arandr \
	brightnessctl calibre cmus dhcpcd dtrx \
	feh qeh gitui gparted \
	icat ipython nftables nmap atlauncher \
	pavucontrol perf picom popsicle ranger \
	rm-improved stress stress-ng tmux tor \
	unrar woeusb wtfutil wttr \
	yarn proton-ge-custom-bin protonfixes deluge deluge-gtk \
	macchanger code inxi dkms mesa \
	mesa-utils neovim-lspconfig protontricks lutris nvtop \
	nvitop ascii-image-converter texlive-most pandoc neovim-web-devicons-git cscope ctags xsel scrot ffmpegthumbnailer \
	pipes-rs-git evcxr_repl zathura biber mold \
	lld sccache dex xdg-utils screenfetch \
	scrot picom wmname gnome-keyring seahorse \
	xorg-xbacklight xf86-input-synaptics cheese workrave alsa-utils \
	network-manager-applet pcmanfm gvfs udiskie xarchiver \
	mc polkit mpd mpc ncmpcpp \
	xfmpc xclip xsel clipmenu dxvk-bin \
	lazygit llvm testdisk qt5 qt5-styleplugins \
	lxappearance zathura zathura-pdf-mupdf btop rua \
	nm-connection-editor capnet-assist thunderbird xdg-user-dirs ueberzug \
    figlet choose tldr xh

pip install pynvim sympy tensorflow transformers matplotlib gym pandas rl

cargo install thebook
cargo install grcov
cargo install cargo-llvm-cov

rustup component add llvm-tools-preview

sudo npm i -g pyright
sudo npm i -g neovim
