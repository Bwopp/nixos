{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    import-tree.url = "github:vic/import-tree";

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

    umbriel = {
      url = "git+https://github.com/noctalia-dev/umbriel";
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

    hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";
  };

  outputs =
    { nixpkgs, import-tree, ... }@inputs:
    let
      lib = nixpkgs.lib;

      hostNames = builtins.attrNames (
        lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./hosts)
      );

      mkHost =
        hostName:
        lib.nixosSystem {
          specialArgs = { inherit inputs hostName; };
          modules = [
            (import-tree ./features)
            (import-tree ./hosts/${hostName})
          ];
        };
    in
    {
      nixosConfigurations = lib.genAttrs hostNames mkHost;
    };
}