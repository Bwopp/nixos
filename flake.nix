{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:4evy/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      modules = [
        {
          nixpkgs.config.allowUnfree = true;
          hardware = {
            enableAllFirmware = true;
            enableRedistributableFirmware = true;
          };
        }
        inputs.home-manager.nixosModules.default
        inputs.lix-module.nixosModules.default
        ./home-manager/home.nix
        ./modules/modules.nix
      ];


      mkHost = { hostName, hostConfig }: nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs hostName; };
        modules = modules ++ [ hostConfig ];
      };
    in
    {
      nixosConfigurations.nixos = mkHost {
        hostName = "nixos";
        hostConfig = ./hosts/laptop/configuration.nix;
      };
      nixosConfigurations."12600k-nix" = mkHost {
        hostName = "12600k-nix";
        hostConfig = ./hosts/desktop/configuration.nix;
      };
    };
}
