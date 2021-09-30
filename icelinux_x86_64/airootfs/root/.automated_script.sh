#!/bin/bash

set -eu
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

rm -f /etc/systemd/system/getty@tty1.service.d/autologin.conf
rm -f /root/{.automated_script.sh,.zlogin}
rm -rf /etc/initcpio

pacman-key --init
pacman-key --populate archlinux
pacman-db-upgrade
updatedb
sync

if [ ! -d /root ]; 
then
  mkdir /root
  chmod 700 root 
  chown -R root:root /root
fi

echo 'IceLinux' > /etc/arch-release

echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
