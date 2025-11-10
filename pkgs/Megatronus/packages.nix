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
    openrgb-with-all-plugins

    file-roller
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
    fzf
    git
    wget
    curl
    lsd
    ripgrep
    bat
    less
    zoxide
    fd
    microfetch

    # Networking & containers
    docker
    docker-compose
    wireshark
    nmap

    # Quickshell
    qt6Packages.qt5compat
    libsForQt5.qt5.qtgraphicaleffects
    kdePackages.qtbase
    kdePackages.qtdeclarative

  ];
}

