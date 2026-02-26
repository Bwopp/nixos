{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      maxGenerations = 30;
      resolution = "3000x1876";
      style = {
        interface.resolution = "3000x1876";
        wallpapers = [
          ./bootloader/nix.png
        ];
      };
      
      extraEntries = ''
        /Windows
          protocol: efi
          path: boot():///EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
  };

  # da kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [
      "i915"
      "btrfs"
      "nvme"
      "sd-mod"
      "xhci_pci"
      "thunderbolt"
    ];
    kernelParams = [
      "i915.enable_dc=2"
      "i915.enable_psr=1"
      "pcie_aspm=force"
    ];
  };

  # Networking & Hostname
  networking = {
    hostName = "nixos"; # Define your hostname.
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    networkmanager = { 
      dns = "none";
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
        networkmanager-l2tp
        networkmanager-ssh
      ];
    };
  };

  # BlueTooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Experimental = true;
      Enable = "Souce,Sink,Media,Socket";
    };
  };

  # Time stuff
  time.timeZone = "Pacific/Auckland";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_NZ.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_NZ.UTF-8";
      LC_IDENTIFICATION = "en_NZ.UTF-8";
      LC_MEASUREMENT = "en_NZ.UTF-8";
      LC_MONETARY = "en_NZ.UTF-8";
      LC_NAME = "en_NZ.UTF-8";
      LC_NUMERIC = "en_NZ.UTF-8";
      LC_PAPER = "en_NZ.UTF-8";
      LC_TELEPHONE = "en_NZ.UTF-8";
      LC_TIME = "en_NZ.UTF-8";
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "nz";
    variant = "";
  };

  # Niri and ly
  programs.niri.enable = true;
  services.displayManager.ly = {
    enable = true;
    x11Support = false;
  };

  # Printers Suck
  services.printing.enable = true;

  # Pipewire, audio and bluetooth codecs 
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    extraConfig.pipewire = {
      "context.modules" = [
        {
          name = "libpipewire-module-bluez5";
          args = {
            "bluez5.codecs" = [
              "sbc"
              "aac"
              "aptx"
              "aptx_hd"
              "ldac"
            ];
          };
        }
      ];
    };
  };

  # User
  users.users.bwop = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Bwop";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    packages = with pkgs; [
      # Stuff
    ];
  };

  # Shell
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      tup = "tailscale up";
      tdown = "tailscale down";
      rebuild = "sudo nixos-rebuild switch";
      update = "sudo nix flake update --flake /etc/nixos/";
      gc = "sudo nix-collect-garbage";
      nixgitpush = "sudo git -C /etc/nixos add . && sudo git -C /etc/nixos commit -m (date '+%Y-%m-%d %H:%M:%S') && sudo git -C /etc/nixos push";
      wup = "warp-cli connect";
      wdown = "warp-cli disconnect";
    };
  };

  users.defaultUserShell = pkgs.fish;

  # Allow unfree packages and firmware
  nixpkgs.config.allowUnfree = true;
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    wget
    prismlauncher
    obsidian
    spotify
    git
    btop
    alacritty
    gparted
    fastfetch
    ffmpeg-full
    mangohud
    legcord
    tailscale
    vlc
    mangohud
    vulkan-tools
    mesa
    syncthing
    syncthingtray
    protonplus
    gamemode
    protontricks
    javaPackages.compiler.temurin-bin.jre-17
    ungoogled-chromium
    qbittorrent
    powertop
    cloudflare-warp
    libreoffice-qt
    arduino-ide
    pciutils
    xwayland-satellite
    wl-clipboard
    wlr-randr
    brightnessctl
    polkit_gnome
    cliphist
    gamescope
    kdePackages.breeze
    balatro-mod-manager
    nautilus
    loupe
    file-roller
    gnome.gvfs
    adwaita-icon-theme
    gnome-calculator
    gnome-text-editor
    papers
    fd
  ];

  # File Sharing
  programs.localsend.enable = true;
  
  # File manager stuff
  services.gvfs.enable = true;
  services.samba-wsdd.enable = true;
  services.udisks2.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
    package = pkgs.steam.override {
      extraArgs = "-system-composer";
    };
  };

  # Stuff for screensharing (desktop portals)
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
    ];
    config.niri.default = lib.mkForce [
      "gnome"
    ];
  };
  environment.pathsToLink = [ "/share/application" "/share/xdg-desktop-portal" ];
  
  # Xwayland
  programs.xwayland.enable = true;

  # Polkit
  security.polkit.enable = true;
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  services.howdy.enable = true;
  security.pam.howdy.enable = true;
  services.howdy.control = "sufficient";
  security.pam.howdy.control = "sufficient";

  systemd.services."polkit-agent-helper@".serviceConfig = {
    PrivateDevices = "no";
    DeviceAllow = [ "char-video4linux rw" "char-mem" "char-hidraw"];
  };

  security.pam.services.sudo.text = lib.mkForce ''
    auth    required    pam_unix.so
    account required    pam_unix.so
    session required    pam_unix.so
  '';

  security.pam.services.polkit-1.text = lib.mkForce ''
    auth    required    pam_unix.so
    account required    pam_unix.so
    session required    pam_unix.so
  '';
  
  # Keyring
  services.gnome.gnome-keyring.enable = true;

  # Power management
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # GPU stuff for drivers and hadware
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-media-driver
      mesa
      libva
      libva-utils
      intel-compute-runtime
    ];
  };

  # Fix intel wifi be200 not restoring after sleep
  systemd.services.disable-d3cold-wifi = {
    description = "Disable D3cold for Wifi";
    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''/bin/sh -c "echo 0 > /sys/bus/pci/devices/0000:01:00.0/d3cold_allowed"'';
    };
  };

  # Disable waiting for netowork on boot
  systemd.services.NetworkManager-wait-until-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  # ssh
  services.openssh.enable = false;

  # Tailscale
  services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";

  # Warp
  services.cloudflare-warp.enable = true;
  services.cloudflare-warp.openFirewall = true;

  # btrfs autoscrub
  services.btrfs.autoScrub.interval = "monthly";

  # Syncthing
  services.syncthing = {
    openDefaultPorts = true;
    user = "bwop";
    configDir = "/home/bwop/.config/syncthing";
  };

  # Good stuff
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Firewall
  networking.nftables.enable = true;
  # networking.firewall.allowedTCPPorts = [ 25565 ];
  # networking.firewall.allowedUDPPorts = [ 25565 ];
  # networking.firewall.enable = false;

  system.stateVersion = "25.11"; # Did you read the comment? no lol
}
