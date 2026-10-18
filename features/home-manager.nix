{ inputs, hostName, ... }:
{
  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = false;
    extraSpecialArgs = { inherit inputs hostName; };
    sharedModules = [
      { disabledModules = [ "programs/noctalia" ]; }
      {
        services.mpris-proxy.enable = true;
        home.pointerCursor.enable = true;
      }
    ];
  };
}