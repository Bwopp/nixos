{ inputs, pkgs, hostName, ... }:
let
  globalModules = [
    inputs.niri.homeModules.niri
    inputs.noctalia.homeModules.default
    inputs.stylix.homeModules.stylix
    inputs.spicetify-nix.homeManagerModules.default
    inputs.nixcord.homeModules.nixcord
    ./stylix.nix
    ./alacritty.nix
    ./noctalia.nix
    ./niri.nix
    ./codium.nix
    ./floorp.nix
    ./obsidian.nix
    ./spicetify.nix
    ./nixcord.nix
    ./git.nix
    ./xdg.nix
  ];

  perHostModules = {
    "nixos" = [

    ];
    "12600k-nix" = [

    ];
  };
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = false;
    extraSpecialArgs = { inherit inputs hostName; };
    users = {
      "bwop" = {
        home = {
          username = "bwop";
          homeDirectory = "/home/bwop";
          stateVersion = "25.05";
          pointerCursor.enable = true;
        };
        programs.home-manager.enable = true;

        services.mpris-proxy.enable = true;

        imports = globalModules ++ perHostModules.${hostName};
      };
    };
  };
}
