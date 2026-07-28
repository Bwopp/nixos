{ pkgs, inputs, ... }:
{
  imports = [
      ./hardware-configuration.nix
    ];

  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.pinned
  ];

  nixpkgs.config.rocmSupport = true;

  nix.settings = { 
    substituters = [ "https://attic.xuyh0120.win/lantian" ];
    trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
  };

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
  
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

  networking.hostName = "12600k-nix";

  time.timeZone = "Pacific/Auckland";

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

  services.xserver.xkb = {
    layout = "nz";
    variant = "";
  };

  services.printing.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  systemd.tmpfiles.rules =
  let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in
  [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];

  hardware.amdgpu.opencl.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment? no :|
}
