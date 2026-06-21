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

    ];
    "12600k-nix" = [

    ];
  };
in
{
  imports = globalModules ++ perHostModules.${hostName};
}