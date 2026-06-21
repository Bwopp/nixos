{ config, pkgs, inputs, lib, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
    ];
    config.niri.default = lib.mkForce [
      "gnome"
    ];
  };
  environment.pathsToLink = [
    "/share/application"
    "/share/xdg-desktop-portal"
  ];
}