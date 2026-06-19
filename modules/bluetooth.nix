{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Experimental = true;
      Enable = "Souce,Sink,Media,Socket";
    };
  };
}