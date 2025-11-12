# NixOS

export NIX_CONFIG="experimental-features = nix command flakes"
mount -o subvol=@ /dev/<your-root-partition> /mnt
mkdir -p /mnt/{home,boot,var/log,nix}
mount -o subvol=@home /dev/<your-root-partition> /mnt/home
mount -o subvol=@log /dev/<your-root-partition> /mnt/var/log
mount -o subvol=@pkg /dev/<your-root-partition> /mnt/nix
