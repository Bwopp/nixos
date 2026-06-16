{ config, pkgs, inputs, ... }:
{
  # Home manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = false;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "bwop" = {
        home.username = "bwop";
        home.homeDirectory = "/home/bwop";
        home.stateVersion = "25.05";

        programs.home-manager.enable = true;
        
        # Music
        services.mpris-proxy.enable = true;

        imports = [
          inputs.niri.homeModules.niri
          inputs.noctalia.homeModules.default
          inputs.stylix.homeModules.stylix
          inputs.spicetify-nix.homeManagerModules.default
          ./stylix.nix
          ./alacritty.nix
          ./noctalia.nix
          ./niri.nix
          ./codium.nix
          ./floorp.nix
          ./obsidian.nix
          ./spicetify.nix
        ];
      };
    };
  };
}