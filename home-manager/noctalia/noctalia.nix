{ hostName, lib, ... }:
let
  globalSettings = [
    ./global/bar.nix
    ./global/control-center.nix
    ./global/default.nix
    ./global/osd.nix
    ./global/plugins.nix
    ./global/shell.nix
    ./global/system-monitor.nix
    ./global/theme.nix
    ./global/widgets.nix
  ];

  perHostSettings = {
    "nixos" = [
      ./laptop/idle.nix
      ./laptop/lockscreen-widgets.nix
    ];
    "12600k-nix" = [
      ./desktop/idle.nix
      ./desktop/lockscreen-widgets.nix
    ];
  };

  merge = lib.foldl' lib.recursiveUpdate { };
in
{
  programs.noctalia = {
    enable = true;
    settings = merge (map import (globalSettings ++ (perHostSettings.${hostName} or [ ])));
  };

  imports = [
    ./theme.nix
  ];
}