#!/bin/bash

install_things(){
	pacman -Syu i3 xorg xorg-xinit polybar rofi nitrogen rofi sddm dhcpcd dhcp grub efibootmgr dosfstools os-prober mtools networkmanager git terminator firefox wget vim sudo
	systemctl enable dhcpcd
	systemctl enable NetworkManager
}
install_themes(){
	cd ~/.
	mkdir Desktop Documents Downloads Pictures Downloads/git-downloads Pictures/Wallpapers Pictures/Screenshots
 	mkdir ~/.config/
  	mkdir ~/.config/i3
	cp ~/easy-install/themes/i3/config ~/.config/i3/
	cp -r ~/easy-install/themes/polybar ~/.config/
	cp -r ~/easy-install/themes/rofi/rofi ~/.config/
 	mkdir ~/.local
 	mkdir ~/.local/share
 	mkdir ~/.local/share/fonts/
  	cp -r ~/easy-install/themes/polybar/fonts ~/.local/share/fonts/
	sudo cp -r ~/easy-install/themes/customisation/candy-icons /usr/share/icons/
	sudo cp -r ~/easy-install/themes/customisation/Sweet-cursors /usr/share/icons/
	sudo cp -r ~/easy-install/themes/customisation/Sweet-Dark-v40 /usr/share/themes/
	sudo cp -r ~/easy-install/themes/customisation/sweet-plasma6 /usr/share/sddm/themes/
	git clone https://aur.archlinux.org/yay
	cd yay 
	makepkg -si
	yay -S sublime-text-4
}


main(){
	echo -e '''

 █████╗ ██████╗  ██████╗██╗  ██╗███╗   ██╗███████╗████████╗
██╔══██╗██╔══██╗██╔════╝██║  ██║████╗  ██║██╔════╝╚══██╔══╝
███████║██████╔╝██║     ███████║██╔██╗ ██║█████╗     ██║   
██╔══██║██╔══██╗██║     ██╔══██║██║╚██╗██║██╔══╝     ██║   
██║  ██║██║  ██║╚██████╗██║  ██║██║ ╚████║███████╗   ██║   
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   
                                                           

	'''
	echo -e " Essential Arch Linux installation programs - [ 1 ]"
	echo -e " Install theme - [ 2 ] "
	read -p "Insert option: " option
	if [[ $option == "1" ]] then
		install_things
	elif [[ $option == "2" ]] then
		install_themes
	fi
}

main
