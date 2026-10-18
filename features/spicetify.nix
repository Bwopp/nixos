# features/<name>.nix
{ config, lib, ... }:
{
  options.features.spicetify.enable = lib.mkEnableOption "spicetify";

  config = lib.mkIf config.features.spicetify.enable {
    home-manager.sharedModules = [
      (
        { ... }:
        {
          programs.spicetify = {
            enable = true;
          };
        }
      )
    ];
  };
}



