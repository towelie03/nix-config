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

    # Gaming
    steam

    file-roller
    obsidian
    xfce.thunar
    adw-gtk3
    font-manager
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
    docker
    docker-compose
    wireshark
    nmap

    # Quickshell
    qt6Packages.qt5compat
    libsForQt5.qt5.qtgraphicaleffects
    kdePackages.qtbase
    kdePackages.qtdeclarative

    # Niri
    xwayland-satellite
  ];
}

