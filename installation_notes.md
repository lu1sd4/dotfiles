# Notes

## Arch installation

### ASUS Laptop

1. Check internet

- Cable: should be ok

- Wifi

```
iwctl
station wlan0 connect NETWORK_NAME
```

2. Keyboard

```
loadkeys es
```

Try with `la-latin1` sometime.

3. Timedate

```
timedatectl set-ntp true
```

4. Disk

List disks and partitions

```
fdisk -l
```

Normally:

`/dev/sda` is the SSD

It's partitioned like:

- `/dev/sda1` (100MB) 
- `/dev/sda2` (16M) Windows shit
- `/dev/sda3` (120G) Windows system
- `/dev/sda4` (40G) Linux root
- `/dev/sda5` (80G) Linux home
- `/dev/sda6` (10G) Linux swap

`/dev/sdb` is the HDD, only one partition.

Format things:

```
# EFI System Partition
# Run mkfs.fat -F32 /dev/sda1 if you need to format the EFI partition

# root partition
mkfs.ext4 /dev/sda4

# swap partition
mkswap /dev/sda6

# optionally, wipe the home partition
mkfs.ext4 /dev/sda5
```

Mount things:

```
# root volume to /mnt
mount /dev/sda4 /mnt

# EFI system partition
mkdir /mnt/efi
mount /dev/sda1 /mnt/efi

# home volume to /home
mkdir /mnt/home
mount /dev/sda5 /mnt/home

# swap
swapon /dev/sda6
```

5. Install the thing

```
# Select mirrors in france, updated within the last 12 hours, supporting http and https, sorted by download speed
reflector --country France --age 12 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Install packages
pacstrap /mnt base base-devel linux linux-firmware neovim
```

6. Configure

fstab
```
# fstab
genfstab -U /mnt >> /mnt/etc/fstab
```

stuff for first boot

```
# root into the new system
arch-chroot /mnt /bin/bash
```

```
# install and enable networkmanager
pacman -S networkmanager
systemctl enable --now NetworkManager
```

```
# install grub
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

# enable microcode
pacman -S intel-ucode

# configure grub

# mount the windows partition
pacman -S ntfs-3g
mount /dev/sda3 /mnt/windows
# ! module 'fuse' not found(?)
pacman -S os-prober

# generate config file
grub-mkconfig -o /boot/grub/grub.cfg
```

```
# root password
passwd

# set timezone
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

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

```
# hostname: carmine
nvim /etc/hostname
```

```
nvim /etc/hosts
```

```
127.0.0.1	localhost
::1		localhost
127.0.1.1	carmine.localdomain	carmine
```

Then, press `ctrl+d` and

```
umount -R /mnt
reboot
```
7. Install my stuff

After rebooting, login as root. May need to
```
systemctl enable --now NetworkManager
```

Then connect to wifi through `nmcli` if necessary

Some things will be here
```
curl -LO https://raw.githubusercontent.com/lu1sd4/dotfiles/master/install_packages.sh
sh install.sh
```

reboot then login with the newly created user, then

```
mkdir repos
cd repos
git clone https://github.com/lu1sd4/dotfiles.git
```

all the links
```

**TODO**
- cloning dotfiles repo and symlinking dotfiles in ~
- enabling services
- enabling bluetooth by default
- check polybar wlan/ethernet plugin
- fill cron tables