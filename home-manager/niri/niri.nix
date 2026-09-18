{ pkgs, inputs, hostName, ... }:
let
  globalModules = [
    ./global/default.nix
    ./global/input.nix
    ./global/keybinds.nix
    ./global/layer-rules.nix
    ./global/layout.nix
    ./global/startup.nix
    ./global/window-rules.nix
  ];

  perHostModules = {
    "nixos" = [
      ./laptop/default.nix
      ./laptop/display.nix
    ];
    "12600k-nix" = [
      ./desktop/default.nix
      ./desktop/display.nix
    ];
  };
in
{
  programs.niri.package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  # inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  # pkgs.niri;
  
  imports = globalModules ++ perHostModules.${hostName};
}
