#!/bin/fish
efibootmgr -n 0000 # Windows is Boot0000
reboot # or maybe suspend to disk
