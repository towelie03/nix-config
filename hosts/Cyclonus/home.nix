{ config, pkgs, inputs, self, ... }:

let
  inherit (pkgs.stdenv.hostPlatform) system;
  allPackages = import ../../pkgs/packages.nix { inherit pkgs; };
  nixvim-package = inputs.nixvim-config.packages.${system}.default;
  extended-nixvim = nixvim-package.extend config.stylix.targets.nixvim.exportedModule;
in {
  home = {
    username = "gwimbly";
    homeDirectory = "/home/gwimbly";
    stateVersion = "25.05";

    packages = allPackages;

    sessionVariables = {
      EDITOR = "nvim";
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
    ../../apps/steam.nix
    ../../apps/lact.nix
    ../../apps/fish/fish.nix
    ../../apps/niri/niri.nix
    ../../apps/nixcord.nix
    ../../apps/nixvim/nixvim.nix
    ../../apps/alacritty.nix
    ../../apps/git.nix
    ../../apps/ghostty.nix
    ../../apps/fastfetch.nix
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

