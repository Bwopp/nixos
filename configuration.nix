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
    inputs.home-manager.nixosModules.home-manager
    ./zen.nix
  ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    useOSProber = true;
    extraEntries = ''
      menuentry "UEFI Firmware Settings" {
          fwsetup
      }
    '';
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # da kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [
    "i915"
    "btrfs"
    "nvme"
    "sd-mod"
    "xhci_pci"
    "thunderbolt"
  ];
  boot.kernelParams = [
    "i915.enable_dc=2"
    "i915.enable_psr=1"
    "pcie_aspm=force"
  ];

  # Hostname
  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  #networking.networkmanager.dns = "none";

  networking.networkmanager.plugins = with pkgs; [
    networkmanager-openvpn
    networkmanager-l2tp
    networkmanager-ssh
  ];

  # Time stuff
  time.timeZone = "Pacific/Auckland";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_NZ.UTF-8";

  i18n.extraLocaleSettings = {
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

  # Niri and ly
  programs.niri.enable = true;
  services.displayManager.ly.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "nz";
    variant = "";
  };

  # Printers Suck
  services.printing.enable = true;

  # BlueTooth
  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
    powerOnBoot = true;
    settings.General.Enable = "Souce,Sink,Media,Socket";
  };

  # Pipewire and stuff
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
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
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = false;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "bwop" = import ./home.nix;
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      tup = "tailscale up";
      tdown = "tailscale down";
      rebuild = "sudo nixos-rebuild switch";
      update = "cd /etc/nixos && sudo nix flake update && cd ~";
      gc = "sudo nix-collect-garbage";
      nixgitpush = "sudo git -C /etc/nixos add . && sudo git -C /etc/nixos commit -m (date '+%Y-%m-%d %H:%M:%S') && sudo git -C /etc/nixos push";
      wup = "warp-cli connect";
      wdown = "warp-cli disconnect";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
    vscode
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
    freecad
    pciutils
    xwayland-satellite
    wl-clipboard
    wlr-randr
    brightnessctl
    quickshell
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
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.floorp-bin;
  };

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

  # Stuff for screensharing
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

  # Power management
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # GPU stuff for drivers and hadware 2
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

  # boot fast
  systemd.services.NetworkManager-wait-until-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  # ssh
  services.openssh.enable = false;

  # Keyring
  services.gnome.gnome-keyring.enable = true;

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
