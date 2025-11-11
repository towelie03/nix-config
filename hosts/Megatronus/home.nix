{ config, pkgs, inputs, ... }:

let
  inherit (pkgs.stdenv.hostPlatform) system;

  # Import your custom packages
  allPackages = import ../../pkgs/Megatronus/hm_packages.nix { inherit pkgs; };
in
{
  home = {
    username = "gwimbly";
    homeDirectory = "/home/gwimbly";
    stateVersion = "25.11";

    # Home Manager packages
    packages = allPackages;

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      NIXOS_OZONE_WL = "1";
    };
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.stylix.homeModules.stylix
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord

    ../../env/stylix/stylix.nix
    ../../apps/fish/fish.nix
    ../../apps/hypr/hypr.nix
    ../../apps/nixcord.nix
    ../../apps/nixvim/nixvim.nix
    ../../apps/alacritty.nix
    ../../apps/git.nix
    #../../apps/fastfetch.nix
    ../../apps/ghostty.nix
    ../../apps/obs.nix
    ../../apps/brave.nix
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
  };
}

