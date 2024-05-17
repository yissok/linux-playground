# GNOME DESKTOP CUSTOM ALIAS ICONS ACTIONS

desktop entry `.desktop` file
```
[Desktop Entry]
Name=a
GenericName=a
Comment=a
Exec=sh Desktop/a.sh
Terminal=true
Type=Application
Icon=a
Categories=GNOME;GTK;
```

`a.sh` file
```
#!/bin/bash
#winclo=$(xdotool search --name Console)
#echo $winclo
#xdotool windowunmap $winclo
kgx
sleep .1s
xdotool key alt+quoteleft
sleep .2s
xdotool key --delay 50 alt+space Up
xdotool key enter
##sleep 0.2s
##xdotool key t i t l space a s d f enter
##sleep 0.2s
##xdotool key k g x enter
##xdotool windowminimize $winclo
##xdotool key --window $winclo ctrl+shift+W
#xdotool windowkill $(xdotool search --name asdf)
##################
#xdotool key Super k g x enter e c h o
#xdotool windowkill getwindowfocus
#xdotool key --window $(xdotool  getwindowfocus) ctrl+shift+w
```


# INSTALL ARCH FROM SCRATCH

```console
f10 boot manager
connect ethernet
cfdisk
100M partition
8G partition
300G partition
write quit
lsblk

/dev/sda1 = /dev/sda5
/dev/sda2 = /dev/sda6
/dev/sda3 = /dev/sda7

FORMAT
mkfs.ext4 /dev/sda7
mkfs.fat -F 32 /dev/sda5
mkswap /dev/sda6

MOUNT
mount /dev/sda7 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda5 /mnt/boot/efi
swapon /dev/sda6

pacstrap /mnt base linux linux-firmware base-devel grub efibootmgr nano networkmanager

genfstab /mnt
genfstab /mnt > /mnt/etc/fstab
cat /mnt/etc/fstab

ENTER LINUX
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
date
hwclock --systohc
nano /etc/locale.gen
	uncomment en_US.UTF-8 UTF-8
locale-gen
nano /etc/locale.conf
	LANG=en_US.UTF-8
nano /etc/hostname
	yissarch

passwd
useradd -m -G wheel -s /bin/bash andrea
passwd andrea
EDITOR=nano visudo
	uncomment line down in file: "#%wheel ALL=(ALL:ALL) ALL" to allow andrea (part of wheel) to run sudo
systemctl enable NetworkManager
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -a
reboot
```
