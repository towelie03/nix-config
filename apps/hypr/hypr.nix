{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;

    systemd.variables = [ "--all" ];

    settings = lib.mkMerge [
      (import ./settings.nix)
      (import ./binds.nix)
      (import ./animations.nix)
      (import ./rules.nix)
    ];
  };
}

