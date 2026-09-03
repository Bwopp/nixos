{ hostName, ... }:
let
  globalModules = [
    ./default.nix
    ./fish.nix
    ./pipewire.nix
    ./greeter.nix
    ./network.nix
    ./bluetooth.nix
    ./packages.nix
    ./niri.nix
    ./portals.nix
    ./steam.nix
  ];

  perHostModules = {
    "nixos" = [
      ./sing-box.nix
      ./miracast.nix
    ];
    "12600k-nix" = [
      ./warp.nix
    ];
  };
in
{
  imports = globalModules ++ perHostModules.${hostName};
}