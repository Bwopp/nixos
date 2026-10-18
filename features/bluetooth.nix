{ config, lib, ... }:
{
  options.features.bluetooth.enable = lib.mkEnableOption "bluetooth";

  config = lib.mkIf config.features.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General = {
        Experimental = true;
        Enable = "Souce,Sink,Media,Socket";
      };
    };
  };
}