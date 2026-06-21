{ config, pkgs, inputs, lib, ... }:
{
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  programs.xwayland = {
    enable = true;
    package = pkgs.xwayland-satellite;
  };
}