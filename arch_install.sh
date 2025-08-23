#!/bin/bash

DEVICE="/dev/sdb"

reflector --verbose --country "Russia" --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

sed -i '/ParallelDownloads = 5/c\ParallelDownloads = 25' /etc/pacman.conf

parted -s $DEVICE mklabel gpt

parted -s $DEVICE mkpart primary fat32 1MiB 513MiB

parted -s $DEVICE set 1 esp on

parted -s $DEVICE mkpart primary ext4 513MiB 100%

mkfs.fat -F32 ${DEVICE}1

mkfs.ext4 ${DEVICE}2

mount ${DEVICE}2 /mnt

mkdir -p /mnt/boot/efi

mount ${DEVICE}1 /mnt/boot/efi

pacstrap /mnt base base-devel linux linux-firmware linux-headers nano vim bash-completion grub efibootmgr networkmanager ttf-opensans ttf-hack ttf-dejavu ttf-ubuntu-font-family ttf-font-awesome ttf-nerd-fonts-symbols man-db man-pages fish nvidia wayland hyprland hyprpaper xdg-desktop-portal-hyprland waybar wofi pipewire pipewire-pulse wireplumber wl-clipboard grim slurp firefox git kitty btop celluloid imv ranger sof-firmware wiremix telegram-desktop

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash <<EOF

systemctl enable NetworkManager

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

hwclock --systohc

echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=ru_RU.UTF-8" > /etc/locale.conf

echo "root:your_passwd" | chpasswd

useradd -m user_name

echo "user_name:passwd" | chpasswd

echo "user_name ALL=(ALL:ALL) ALL" >> /etc/sudoers

grub-install --target=x86_64-efi --efi-directory=/boot/efi

sed -i '/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"/c\GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3"' /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

exit

EOF

umount -R /mnt
