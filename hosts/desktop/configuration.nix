{config, pkgs, inputs, lib, ...}:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # da bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      maxGenerations = 30;
      resolution = "2560x1440";
      style = {
        interface.resolution = "2560x1440";
        wallpapers = [
          ./bootloader/nix.png
        ];
      };

    extraEntries = ''
      /Windows
        protocol: efi
        path: uuid(fdfecdc9-7a11-4268-8bbf-7c9b3b919399):/EFI/Microsoft/Boot/bootmgfw.efi
    '';
    };
  };
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Networking & Hostname
  networking.hostName = "12600k-nix";

  # Set your time zone.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "nz";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.amdgpu.opencl.enable = true;
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

  system.stateVersion = "25.11"; # Did you read the comment? no :|

}
