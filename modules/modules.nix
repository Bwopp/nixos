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
    ./steam.nix
    ./umbriel.nix
  ];

  perHostModules = {
    "nixos" = [
      ./sing-box.nix
    ];
    "12600k-nix" = [
      ./warp.nix
      ./handbreak-amd.nix
    ];
  };
in
{
  imports = globalModules ++ perHostModules.${hostName};
}