{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    mesa
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    tlp
    acpi
    lm_sensors
    power-profiles-daemon
    networkmanagerapplet

    # Gaming
    steam

    adw-gtk3
    feishin

    # TUI
    btop

    # Desktop
    nwg-look

    # Development
    rustup
    gcc
    gh
    nixfmt-rfc-style
    nixpkgs-fmt
    black

    # Utilities
    jq
    socat
    tree
    libnotify
    wl-clipboard
    cliphist
    pywalfox-native
    wallust
    imagemagick
    rar
    unzip
    p7zip
    mpv
    cava
    brightnessctl
    lazygit
    superfile
    fzf
    git
    wget
    curl
    lsd
    ripgrep
    bat
    starship
    less
    zoxide
    fd
    microfetch

    # Networking & containers
    tailscale
    qemu
    docker
    docker-compose
    wireshark
    nmap

    # Niri
    xwayland-satellite
  ];
}

