{ config, pkgs, lib, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    enableReleaseChecks = false;

    # Transparency
    opacity.terminal = 0.8;

    # Theming targets
    targets = {
      nixvim.enable = true;
      nixos-icons.enable = true;
      nixcord.enable = false;
    };

    # Base16 theme
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/synth-midnight-dark.yaml";

    # Fonts
    fonts = {
      serif = {
        package = pkgs.nerd-fonts.ubuntu;
        name = "Ubuntu Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.ubuntu;
        name = "Ubuntu Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };

    # Cursor
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Dark";
      size = 14;
    };
  };
}

