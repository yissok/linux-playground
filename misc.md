WAKEUP
	cat /sys/power/mem_sleep

	echo s2idle | sudo tee /sys/power/mem_sleep

	sudo ethtool -s wlo1 wol d
	sudo lshw -class network -short



	sudo sh -c 'echo LID0 > /proc/acpi/wakeup'
	sudo sh -c 'echo RP01 > /proc/acpi/wakeup'
	sudo sh -c 'echo RP05 > /proc/acpi/wakeup'
	sudo sh -c 'echo XHCI > /proc/acpi/wakeup'
	sudo sh -c 'echo PWRB > /proc/acpi/wakeup'
	sudo sh -c 'echo AWAC > /proc/acpi/wakeup'
	cat /proc/acpi/wakeup | grep 'enabled'
	systemctl suspend

	sudo udevadm control --reload-rules
	/etc/udev/rules.d/usbdevices.rules
	
	ls /sys/bus/i2c/devices/*/power/
	echo disabled > /sys/bus/i2c/devices/i2c-ELAN0678\:00/power/wakeup
	 sudo sh -c 'echo disabled > /sys/bus/i2c/devices/i2c-ESSX8326:00/power/wakeup'

AUDIO
	alsamixer
DOCKER
	sudo systemctl start docker.service
INTELLIJ
	rm /home/andrea/.var/app/com.jetbrains.IntelliJ-IDEA-Community/config/JetBrains/IdeaIC2024.1/.lock
GNOME RESTART
  killall -3 gnome-shell
CHECK POWER STATUS
  upower -i /org/freedesktop/UPower/devices/battery_BAT0
FIREFOX
  https://github.com/vinceliuice/WhiteSur-gtk-theme/tree/master
WhiteSur
  cd /home/andrea/Documents/WhiteSur-gtk-theme
SOUND
  amixer sset Speaker unmute
  amixer sset Headphone unmute
BLUETOOTH
  systemctl restart bluetooth
  systemctl restart bluetooth
  sudo btmgmt le on
ALL PACKAGES
  LC_ALL=C.UTF-8 pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | LC_ALL=C.UTF-8 sort -h

PATH
  /home/andrea/Documents/misc/downloaded-apps/squashfs-root/usr/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/var/lib/flatpak/exports/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

     



/home/andrea/Documents/WhiteSur-icon-theme/src/


gtk-update-icon-cache


cd /usr/bin/startup-actions
systemctl enable --user bluetooth-restart.service




sudo nano /etc/gdm3/custom.conf

add below to bashrc
stickies
new layout, smaller master 60 by 60
create icon desktop able to run script such as double click it and enters host file editing mode


