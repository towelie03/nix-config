{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;

    # Import your existing hyprland.conf
    config = builtins.readFile "${config.home.homeDirectory}/.config/hypr/hyprland.conf";
  };
}

