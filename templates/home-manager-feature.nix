{ config, lib, inputs, ... }:
{
  options.features.INSERT_NAME = {
    enable = lib.mkEnableOption "feature name";

    overrides = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
      description = "somthing";
    };
  };

  config = lib.mkIf config.features.INSER_NAME.enable {
    home-manager.sharedModules = [
      inputs.SOME_HOME_MANAGER_MODULE
      (
        { ... }:
        {

        }
      )
    ];
  };
}