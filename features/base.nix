{ inputs, ... }:
{
  imports = [
    inputs.lix-module.nixosModules.default
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };
}