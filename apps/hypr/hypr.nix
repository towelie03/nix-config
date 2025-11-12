{ lib, pkgs, ... }:

{
  # Hyprland settings
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;           # ensures binary exists
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    settings = (import ./settings.nix)
      // (import ./binds.nix)
      // (import ./animations.nix)
      // (import ./rules.nix)
      // {
        decoration.shadow.color = lib.mkForce "rgba(0, 0, 0, 0.25)";
      };
  };

  # Set your environment variables for Hyprland/Wayland apps
  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
    HYPRSHOT_DIR = "${pkgs.writeText "hyprshot-dir" "$HOME/Pictures/Screenshots"}";
  };
}

