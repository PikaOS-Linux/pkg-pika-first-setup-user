#! /bin/bash
 mkdir -pv "$1"/media/cdrom
 mount --bind /cdrom "$1"/media/cdrom
 mount --rbind /dev "$1"/dev
 mount --rbind /dev/pts "$1"/dev/pts
 mount --rbind /proc "$1"/proc
 mount --rbind /sys "$1"/sys
 mount --rbind /run "$1"/run
 mkdir -p "$1"/var/cache/apt/archives
 cp -rvf /cdrom/pool/main/* "$1"/var/cache/apt/archives/
 genfstab -U "$1" > "$1"/etc/fstab
 chroot /chroot_dir /bin/bash -c "su - -c /usr/lib/pika/pikainstall/pika-install-chroot.sh"