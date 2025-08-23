#!/bin/bash

DEVICE="/dev/sdb"
USERNAME="username"
PASSWORD="password"
TIMEZONE="Europe/Moscow"
LOCALE="ru_RU.UTF-8"

reflector --verbose --country "Russia" --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

sed -i '/ParallelDownloads = 5/c\ParallelDownloads = 25' /etc/pacman.conf

log "Partitioning disk $DEVICE..."

parted -s $DEVICE mklabel gpt

parted -s $DEVICE mkpart primary fat32 1MiB 513MiB

parted -s $DEVICE set 1 esp on

parted -s $DEVICE mkpart primary ext4 513MiB 100%

log "Formatting partitions..."

mkfs.fat -F32 ${DEVICE}1

mkfs.ext4 ${DEVICE}2

log "Mounting partitions..."

mount ${DEVICE}2 /mnt

mkdir -p /mnt/boot/efi

mount ${DEVICE}1 /mnt/boot/efi

log "Installing system..."

pacstrap /mnt base base-devel linux linux-firmware linux-headers nano vim bash-completion grub efibootmgr networkmanager ttf-opensans ttf-hack ttf-dejavu ttf-ubuntu-font-family ttf-font-awesome ttf-nerd-fonts-symbols man-db man-pages fish nvidia wayland hyprland hyprpaper xdg-desktop-portal-hyprland waybar wofi pipewire pipewire-pulse wireplumber wl-clipboard grim slurp firefox git kitty btop celluloid imv ranger sof-firmware wiremix telegram-desktop

log "Generating fstab..."

genfstab -U /mnt >> /mnt/etc/fstab

log "Configuring system..."

arch-chroot /mnt

systemctl enable NetworkManager

log "Changing time zone..."

ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime

hwclock --systohc

log "Setting locale..."

echo "$LOCALE UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=$LOCALE" > /etc/locale.conf

log "Setting user and passwords..."

echo "root:$PASSWORD" | chpasswd

useradd -m $USERNAME

echo "$USERNAME:$PASSWORD" | chpasswd

echo "%USERNAME ALL=(ALL) ALL" >> /etc/sudoers

log "Setting loader..."

grub-install $DEVICE

sed -i '/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"/c\GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3"' /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

log "Finishing and unmounting..."

exit

umount -R /mnt

log "Installation complete!"
