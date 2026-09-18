{ config, lib, pkgs, ... }:
{
  programs.niri.settings = {
    xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

    environment = {
      NIRI_BACKGROUND_COLOR = "${config.lib.stylix.colors.base00}";
    };

    prefer-no-csd = true;

    gestures.hot-corners.enable = false;

    hotkey-overlay.skip-at-startup = true;
  };
}