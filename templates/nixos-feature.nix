{ config, lib, ... }:
{
  options.features.INSERT_NAME.enable = lib.mkEnableOption "Feature name";

  config = lib.mkIf config.features.INSERT_NAME.enable {


  };
}
