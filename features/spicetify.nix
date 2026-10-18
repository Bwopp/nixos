{ config, lib, inputs, ... }:
{
  options.features.spicetify.enable = lib.mkEnableOption "spicetify";

  config = lib.mkIf config.features.spicetify.enable {
    home-manager.sharedModules = [
      inputs.spicetify-nix.homeManagerModules.default
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



