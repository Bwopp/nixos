{ config, lib, pkgs, inputs, ... }:
{
  options.features.gaming-packages.enable = lib.mkEnableOption "gaming-packages";

  config = lib.mkIf config.features.gaming-packages.enable {
    environment.systemPackages = with pkgs; [
      mangohud
      protonplus
      balatro-mod-manager
      satisfactorymodmanager
      inputs.hytale-launcher.packages.x86_64-linux.default
      lutris
    ]; 
  };
}