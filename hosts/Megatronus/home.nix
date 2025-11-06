{ config, pkgs, inputs, ... }:

let
  inherit (pkgs.stdenv.hostPlatform) system;

  # Import your custom packages
  allPackages = import ../../pkgs/hm_packages.nix { inherit pkgs; };
in
{
  home = {
    username = "gwimbly";
    homeDirectory = "/home/gwimbly";
    stateVersion = "25.05";

    # Home Manager packages
    packages = allPackages;

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    # Inputs
    inputs.hyprland.homeModules.hyprland
    inputs.stylix.homeModules.stylix
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.hyprland
    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord

    # Local modules
    ../../env/stylix/stylix.nix
    #../../apps/steam.nix
    ../../apps/fish/fish.nix
    ../../apps/hypr/hypr.nix
    ../../apps/nixcord.nix
    ../../apps/nixvim/nixvim.nix
    ../../apps/alacritty.nix
    ../../apps/git.nix
    ../../apps/ghostty.nix
    ../../apps/obs.nix
    ../../apps/brave.nix
    ../../apps/lazygit.nix
    ../../apps/btop.nix
    ../../apps/superfile.nix
    ../../apps/starship/starship.nix
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  programs = {
    home-manager.enable = true;

    dankMaterialShell = {
      enable = true;
      enableSystemd = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    nixvim = {
      extraPackages = with pkgs; [ wl-clipboard ];
      opts.clipboard = [ "unnamedplus" ];
    };
    
    protontricks = {
      enable = true; # this is enough to install it if it exists in Nixpkgs
    };
    #steam = {
    #  enable = true;
    #};
  };
}

