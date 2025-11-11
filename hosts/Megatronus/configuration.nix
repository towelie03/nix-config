{ config, pkgs, inputs, lib, self, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    inputs.dankMaterialShell.nixosModules.greeter
    ../../env/env.nix
    ../../pkgs/Megatronus/packages.nix
    ../../apps/steam.nix
    ../../apps/lact.nix
    "${self}/apps/nautilus.nix"
  ];

  # Timezone
  time.timeZone = "America/Vancouver";

  nixpkgs.config = {
    allowUnfree = true;
    overlays = [
      (final: prev: {
        nur = import inputs.nur { nurpkgs = prev; pkgs = prev; };
      })
    ];
  };

  users = {
    mutableUsers = true;

    groups = {
      i2c = {};
      wireshark = {};
    };

    users = {
      gwimbly = {
        isNormalUser = true;
        description = "gwimbly";
        shell = pkgs.fish;
        extraGroups = [
          "wheel" "networkmanager" "audio" "video" "input"
          "plugdev" "bluetooth" "i2c" "wireshark"
        ];
        initialPassword = "test";
      };

      root = {
        initialPassword = "root";
      };
    };
  };


  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      wheelNeedsPassword = false;
      extraRules = [{
        users = [ "gwimbly" ];
        keepEnv = true;
        persist = true;
      }];
    };
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."gwimbly" = import ./home.nix;
    backupFileExtension = "bak";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
    nerd-fonts.ubuntu
    nerd-fonts.mononoki 
    nerd-fonts.fira-code
    nerd-fonts.roboto-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    material-icons
    material-symbols
    nixos-icons
    bibata-cursors
    candy-icons
  ];
  
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot"; # must match your filesystem mount
      };

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        # efiInstallAsRemovable = true; # uncomment if firmware ignores variables
      };
    };

    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "i2c-dev" "kvm-amd" ];
    initrd.availableKernelModules = [ "i2c-dev" "kvm-amd"];
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    power-profiles-daemon.enable = true;
    upower.enable = true;
    printing.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };

    dbus = {
      enable = true;
      packages = [ pkgs.bluez ];
    };

    xserver.enable = false;
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
  };

  networking = {
    hostName = "Megatronus";
    wireless = {
      enable = false;
      userControlled.enable = false;
    };
    networkmanager = {
      enable = true;
      wifi = {
        backend = "wpa_supplicant";
        powersave = false;
      };
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        config.boot.kernelPackages.nvidiaPackages.latest
      ];
    };

    nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      powerManagement.enable = false;
      open = true;
    };
  };




  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = lib.genAttrs [
      "LC_ADDRESS" "LC_IDENTIFICATION" "LC_MEASUREMENT" "LC_MONETARY"
      "LC_NAME" "LC_NUMERIC" "LC_PAPER" "LC_TELEPHONE" "LC_TIME"
    ] (_: "en_US.UTF-8");
  };

  programs = {
    fish.enable = true;
    wireshark = {
      enable = true;
      usbmon.enable = true;
    };
    dconf.enable = true;
    ssh.startAgent = true;
    nh = {
      enable = true;
      flake = "/home/gwimbly/.nixos-config/";
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
    };
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  environment = {
    shellAliases.sudo = "doas";
    systemPackages = with pkgs; [
      bluez tlp lm_sensors openssl nh
    ];
    variables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

  services.udev.packages = [ pkgs.rwedid ];
  system.stateVersion = "25.11"; 

}
