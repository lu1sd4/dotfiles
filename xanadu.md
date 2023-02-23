# Arch installation

## xanadu

1. Check internet

This laptop has no ethernet port. `iwctl` is available.

```
iwctl
station wlan0 connect NETWORK_NAME
exit
ping wiki.archlinux.org
```

**Note:** NETWORK_NAME can be tab-completed.

2. Keyboard

Leave as is. Default is us.

3. Timedate

Enable network tyme sync

```
timedatectl set-ntp true
```

4. Disks

List disks and partitions

```
fdisk -l
```

`/dev/nvme0n1` is the NVMe drive.

Partitions:

- `/dev/nvme0n1p1` 100M EFI System Partition
- `/dev/nvme0n1p2` 16M More Windows stuff
- `/dev/nvme0n1p3` 124.4G Windows system
- `/dev/nvme0n1p4` 509M More Windows stuff
- `/dev/nvme0n1p5` 125G Linux root
- `/dev/nvme0n1p6` 334G Linux home
- `/dev/nvme0n1p7` 362G Windows home
- `/dev/nvme0n1p8` 7.8G Linux swap

Format partitions

```
# root partition
mkfs.ext4 /dev/nvme0n1p5

# swap partition
mkswap /dev/nvme0n1p8

# THIS WIPES home partition
mkfs.ext4 /dev/nvme0n1p6 
```

Mount partitions

```
# root to /mnt
mount /dev/nvme0n1p5 /mnt

# EFI system partition
mkdir /mnt/efi
mount /dev/nvme0n1p1 /mnt/efi

# home to /home
mkdir /mnt/home
mount /dev/nvme0n1p6 /mnt/home

# swap
swapon /dev/nvme0n1p8
```

5. Installation

Get mirrors

```
# Select mirrors in france, updated within the last 12 hours, supporting http and https, sorted by download speed
reflector --country France --age 12 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

Install packages

```
# Install packages
pacstrap /mnt base base-devel linux linux-firmware neovim networkmanager git
```

**Note:** With a not recent arch ISO, there might be keyring errors, run `pacman -Sy archlinux-keyring` to update keyring.

1. Configuration

Export fstab

```
# fstab
genfstab -U /mnt >> /mnt/etc/fstab
```

Setup for first boot

```
# root into new system
arch-chroot /mnt /bin/bash
```

Install and configure grub

```
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

# enable intel microcode updates
pacman -S intel-ucode

# detect windows
pacman -S ntfs-3g os-prober
mkdir /mnt/windows
mount /dev/nvme0n1p3 /mnt/windows
pacman -S os-prober

# uncomment GRUB_DISABLE_OS_PROBER=false
nvim /etc/default/grub

# generate grub config file
grub-mkconfig -o /boot/grub/grub.cfg
```

Locale

```
# set locale
# uncomment desired locale
nvim /etc/locale.gen
# en_IE.UTF-8 UTF8 ftw. Uncomment it.
locale-gen
# add LANG=en_IE.UTF-8 to the following file
nvim /etc/locale.conf
# add KEYMAP=es to the following file
nvim /etc/vconsole.conf
```

Hostname: xanadu

```
nvim /etc/hostname
```

```
xanadu
```

```
nvim /etc/hosts
```

```
127.0.0.1	localhost
::1		localhost
127.0.1.1	xanadu.localdomain	xanadu

```

Press `ctrl+d` to exit `arch-chroot`.

```
umount -R /mnt
reboot
```

7. After reboot

enable NetworkManager

```
systemctl enable --now NetworkManager
```

Connect to wifi network

```
nmcli d wifi connect NETWORK_NAME password PASSWORD
```

Init git

```
git config --global user.name "lu1sd4"
git config --global user.email EMAIL
```

Install yay

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Clone repo

```
git clone https://github.com/lu1sd4/dotfiles.git
```

Install essentials

```
cd install_scripts
./1-x.sh
./2-hw.sh
./3-sw-pacman.sh
./3-sw-aur.sh
./5-setup.sh
```