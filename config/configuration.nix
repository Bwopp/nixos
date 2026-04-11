{config, pkgs, inputs, lib, ...}:

# ldac fix
let
  pipewireLdacWorkaround = pkgs.pipewire.overrideAttrs (old: {
    mesonFlags = (old.mesonFlags or [ ]) ++ [
      "-Dbluez5-codec-ldac-dec=disabled"
    ];
  });
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # da bootloader
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
      wifi.backend = "wpa_supplicant";
      enable = true;
      # dns = "none";
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
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };
  
  services.displayManager.ly = {
    enable = true;
    x11Support = false;
  };

  # Pipewire, audio and bluetooth codecs 
  security.rtkit.enable = true;
  services.pipewire = {
    package = pipewireLdacWorkaround;
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
      enable = true;
      package = pkgs.wireplumber.override {
        pipewire = pipewireLdacWorkaround;
      };
    };
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
      "input"
      "render"
    ];
  };

  # Shell
  programs.fish = {
    enable = true;
      interactiveShellInit = ''
        # TokyoNight Storm
        set -g fish_color_normal c0caf5
        set -g fish_color_command 7dcfff
        set -g fish_color_keyword bb9af7
        set -g fish_color_quote e0af68
        set -g fish_color_redirection c0caf5
        set -g fish_color_end ff9e64
        set -g fish_color_option bb9af7
        set -g fish_color_error f7768e
        set -g fish_color_param 9d7cd8
        set -g fish_color_comment 565f89
        set -g fish_color_selection --background=2e3c64
        set -g fish_color_search_match --background=2e3c64
        set -g fish_color_operator 9ece6a
        set -g fish_color_escape bb9af7
        set -g fish_color_autosuggestion 565f89
        set -g fish_pager_color_progress 565f89
        set -g fish_pager_color_prefix 7dcfff
        set -g fish_pager_color_completion c0caf5
        set -g fish_pager_color_description 565f89
        set -g fish_pager_color_selected_background --background=2e3c64
      '';

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
      vup = "systemctl start sing-box";
      vdown = "systemctl stop sing-box";
    };
  };

  users.defaultUserShell = pkgs.fish;

  # Allow unfree packages and firmware
  nixpkgs.config.allowUnfree = true;
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };

  nixpkgs.config.packageOverrides = pkgs: {
    handbrake = pkgs.handbrake.overrideAttrs (old: {
      configureFlags = old.configureFlags ++ [ "--enable-qsv" ];
      buildInputs = old.buildInputs ++ [
        pkgs.libvpl
        pkgs.libva
        pkgs.intel-media-driver
      ];
      nativeBuildInputs = old.nativeBuildInputs ++ [
        pkgs.libvpl
      ];
      NIX_CFLAGS_COMPILE = "-I${pkgs.libvpl}/include/vpl";
      env = (old.env or {}) // {
        NIX_LDFLAGS = (old.env.NIX_LDFLAGS or "") + " -lva -lvpl -lva-drm";
      };
    });
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
    syncthing
    syncthingtray
    protonplus
    gamemode
    javaPackages.compiler.temurin-bin.jre-17
    qbittorrent
    cloudflare-warp
    xwayland-satellite
    wl-clipboard
    wlr-randr
    brightnessctl
    cliphist
    gamescope
    kdePackages.breeze
    nautilus
    loupe
    file-roller
    gnome.gvfs
    adwaita-icon-theme
    gnome-calculator
    gnome-text-editor
    papers
    fd
    jellyfin-desktop
    proton-authenticator
    element-desktop
    sing-box
    handbrake
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

  # Keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.ly.enableGnomeKeyring = true;

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
      intel-gmmlib
      intel-npu-driver
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

  systemd.services.sing-box = {
    description = "sing-box";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.sing-box}/bin/sing-box run -c /home/bwop/.config/sing-box/config.json";
      Restart = "on-failure";
      RestartSec = "5s";
      User = "root";
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
  # networking.firewall.enable = false;
  networking.firewall.trustedInterfaces = [ "p2p-wl+" ];
  networking.firewall.allowedTCPPorts = [ 7236 7250 ];
  networking.firewall.allowedUDPPorts = [ 7236 5353 ];

  system.stateVersion = "25.11"; # Did you read the comment? no lol
}
