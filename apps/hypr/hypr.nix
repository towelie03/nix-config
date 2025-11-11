{ config, pkgs, lib, inputs, ... }:

let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    #package = inputs.hyprland.packages.${system}.hyprland;
    #portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;

    systemd.variables = [ "--all" ];

    settings = lib.mkMerge [
      (import ./settings.nix)
      (import ./binds.nix)
      (import ./animations.nix)
      (import ./rules.nix)
    ];
  };
}

