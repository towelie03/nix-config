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
    # Inputs
    inputs.niri.homeModules.niri
    inputs.stylix.homeModules.stylix
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord

    # Local modules
    ../../env/stylix/stylix.nix
    #../../apps/steam.nix
    ../../apps/fish/fish.nix
    ../../apps/fastfetch/fastfetch.nix
    ../../apps/niri/niri.nix
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
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
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
      quickshell.package = inputs.quickshell.packages.x86_64-linux.quickshell;
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

