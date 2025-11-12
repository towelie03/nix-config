{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

  };

  # Enable Gamescope separately on your channel
  programs.gamescope.enable = true;

  # Modern way to set session env vars
  environment.sessionVariables = {
    SDL_VIDEODRIVER = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  environment.systemPackages = [
    # ... other packages
    pkgs.steam-run
    pkgs.steamcmd
    pkgs.steam-tui
    pkgs.protontricks
    pkgs.lutris
    pkgs.protonup-qt
    pkgs.nexusmods-app
    pkgs.winetricks
  ];


}

