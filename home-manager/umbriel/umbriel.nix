{ config, pkgs, hostName, lib, ... }@args:
let
  globalSettings = [
    ./global/default.nix
    ./global/input.nix
    ./global/keybinds.nix
    ./global/layer-rules.nix
    ./global/layout.nix
    ./global/theme.nix
    ./global/window-rules.nix
  ];

  perHostSettings = {
    "nixos" = [
      ./laptop/default.nix
      ./laptop/display.nix
    ];
    "12600k-nix" = [
      ./desktop/default.nix
      ./desktop/display.nix
    ];
  };

  files = globalSettings ++ (perHostSettings.${hostName} or [ ]);
  evalFile = file:
    let
      imported = import file;
    in
    if builtins.isFunction imported then imported args else imported;

  merge = lib.foldl' lib.recursiveUpdate { };
in
{
  programs.umbriel = {
    enable = true;
    settings = merge (map evalFile files);
  };
}