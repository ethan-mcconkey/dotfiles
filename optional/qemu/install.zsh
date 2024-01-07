#!/bin/zsh

# https://www.qemu.org/ https://virt-manager.org/
echo "---------- INSTALLING QEMU AND VIRT-MANAGER ----------"
sudo nala install qemu-kvm qemu-system qemu-utils python3 python3-pip libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y

echo "---------- AUTO-STARTING VIRTUAL NETWORK ----------"
sudo virsh net-start default
sudo virsh net-autostart default

echo "---------- ADDING CURRENT USER TO QEMU AND VIRT-MANAGER ----------"
sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt-qemu $USER
sudo usermod -aG kvm $USER
sudo usermod -aG input $USER
sudo usermod -aG disk $USER
