{ pkgs, ... }:
{
  imports = [
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
      "xe"
      "btrfs"
      "nvme"
      "sd-mod"
      "xhci_pci"
      "thunderbolt"
    ];
    kernelParams = [
      "pcie_aspm=force"
    ];
  };

  networking.hostName = "nixos";

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

  networking.firewall.allowedTCPPorts = [
    7236
    7250
  ];
  networking.firewall.allowedUDPPorts = [
    7236
    5353
  ];

  system.stateVersion = "25.11"; # Did you read the comment? no lol
}
