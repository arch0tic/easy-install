#!/bin/bash

install_things(){
	pacman -Syu i3 xorg xorg-xinit polybar rofi nitrogen rofi sddm dhcpcd dhcp grub efibootmgr dosfstools os-prober mtools networkmanager git terminator firefox wget vim sudo
	systemctl enable dhcpcd
	systemctl enable NetworkManager
}
install_themes(){
	cd ~/
	mkdir Desktop Documents Downloads Pictures Downloads/git-downloads Pictures/Wallpapers Pictures/Screenshots
	sudo pacman -Syu plasma lxappearance gtk-engines
	cp themes/i3/config ~/.config/i3/
	cp -r themes/polybar ~/.config/
	cp -r themes/rofi ~/.config/
	sudo cp -r themes/candy-icons /usr/share/icons/
	sudo cp -r themes/Sweet-cursors /usr/share/icons/
	sudo cp -r themes/Sweet-Dark-v40 /usr/share/themes/
	sudo cp -r themes/sweet-plasma6 /usr/share/sddm/themes/
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
	echo -e "[ First option is for apps install in CHROOT ] "
	echo -e "[ And the second option is for themeing only ] "
	read -p "Insert option: " option
	if [[ $option == "1" ]] then
		install_things
	elif [[ $option == "2" ]] then
		install_themes
	fi
}

main
