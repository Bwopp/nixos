{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    mangohud
    protonplus
    balatro-mod-manager
    satisfactorymodmanager
    inputs.hytale-launcher.packages.x86_64-linux.default
    lutris
  ];
}