{
  config,
  pkgs,
  inputs,
  ...
}:
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
          ./alacritty.nix
          ./noctalia-shell.nix
          ./niri.nix
          ./vscode.nix
          ./zen.nix
        ];
      };
    };
  };
}