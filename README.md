# ubuntu restore
https://chatgpt.com/share/68bbcadb-839c-8013-b931-b6ba65449535

🟢 Your Backup & Restore Plan
1. 📸 Timeshift (system snapshots)

What it saves: System files, configs, installed updates, desktop tweaks.

What it doesn’t: Your personal files in /home (unless you enable it, but usually better to keep home separate).

Setup:
sudo apt install timeshift


Open Timeshift GUI → Choose RSYNC mode.

Select backup location (external HDD or large USB).

Schedule daily/weekly snapshots.

Exclude /home (keep it separate).

2. 🗂️ Deja Dup or Rsync (home directory)

What it saves: Your files, documents, downloads, and most importantly, hidden configs (.config/, .local/, .bashrc, etc.), which preserve app settings, shortcuts, themes.

Option A: Deja Dup (GUI)

Install if not already:

sudo apt install deja-dup


Configure backup to external drive (or cloud if you prefer).

Set it to include hidden files (.config, .local, etc.) in your home.

Option B: Rsync (manual, flexible)

To back up home:

rsync -aAXHv --progress /home/yourusername/ /path/to/backup/home/


To restore:

rsync -aAXHv --progress /path/to/backup/home/ /home/yourusername/

3. 📦 Package List (apps you installed)

Save list of manually installed apps:

apt-mark showmanual > ~/package-list.txt


Keep this file in your home backup (so it goes with Deja Dup or rsync).

To restore apps on new machine:

xargs sudo apt install -y < ~/package-list.txt

🔄 Restore Plan (New Machine)

Install Ubuntu fresh (ideally same version for best compatibility).

Install Timeshift:

sudo apt install timeshift


Connect backup drive.

Restore last Timeshift snapshot → restores your system configs.

Restore home backup:

If using Deja Dup: open "Backups" app → Restore.

If using rsync: run the restore command.

Restore apps:

xargs sudo apt install -y < ~/package-list.txt


Final check:

Log in → your shortcuts, themes, dotfiles should all be there 🎉.

Run:

sudo apt update && sudo apt upgrade


to refresh drivers and fix any new hardware quirks.

✅ Why this combo works

Timeshift → preserves system tweaks and rollback safety.

Deja Dup/rsync → keeps your personal files and hidden config.

Package list → makes reinstalling apps super fast.

Together → you get a system that looks & behaves almost identical to the old one, even on new hardware.



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
```console
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
