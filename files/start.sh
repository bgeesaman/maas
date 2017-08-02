#!/bin/sh

BASE="/var/lib/tftpboot"
# Perform prep on /var/lib/tftpboot for grub efi booting
mkdir -p $BASE

## Generate mactel boot efi
if [ ! -f $BASE/mactel64.efi ]; then
  grub-mkimage -d /usr/lib/grub/x86_64-efi/ -O x86_64-efi -o $BASE/mactel64.efi -p '(tftp)/boot/grub' -c /grub.cfg-mactel.efi normal configfile net efinet tftp http efi_gop efi_uga all_video gzio part_gpt ext2 echo linux
  rm /grub.cfg-mactel.efi
fi

## Generate bootable TFTP root for grub
if [ ! -d $BASE/boot/grub ]; then
  grub-mknetdir --net-directory=$BASE
fi

## Copy in our grub.cfg files
cp /grub.cfg-i386-pc $BASE/boot/grub/i386-pc/grub.cfg
mv /grub.cfg-i386-pc $BASE/boot/grub/grub.cfg
mv /grub.cfg-x86_64-efi $BASE/boot/grub/x86_64-efi/grub.cfg

# Run dnsmasq
exec /usr/sbin/dnsmasq
