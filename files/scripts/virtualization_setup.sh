#!/bin/bash

source /home/$SUDO_USER/.bash_colors
source /home/$SUDO_USER/.bash_functions
echo -e "\n${blue}VIRTUALIZATION SETUP${reset}"
# $(title "hello world" "$red") #WIP

echo -e "\n\n${green}dependencies...${reset}"
# install OVMF
apt install -y ovmf

# install QEMU
apt install -y qemu-system qemu-kvm qemu-utils

# install libvirt
apt install -y libvirt-clients libvirt-daemon-system bridge-utils

# install virt-manager
apt install -y virt-manager

# install misc. components
apt install -y \
    pciutils \


echo -e "\n\n${green}configuration...${reset}"
echo "available GPUs:"
lspci | grep -i vga | awk '{ $2=""; print $0 }'
# banish guest GPU
read -p 'Guest GPU PCIe BUS: ' bus

lspci -s $bus -n | awk '{ print $3; }'
