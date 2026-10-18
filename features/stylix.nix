{ config, lib, inputs, ... }:
let
  cfg = config.features.stylix;
in
{
  options.features.stylix = {
    enable = lib.mkEnableOption "Stylix theming";

    scheme = lib.mkOption {
      type = lib.types.str;
      default = "ayu-dark";
      example = "ayu-dark";
      description = "Name of a base16 theme";
    };

    cursorSize = lib.mkOption {
      type = lib.types.int;
      default = 24;
      description = "Cursor size in pixels";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [
      inputs.stylix.homeModules.stylix
      (
        { pkgs, ... }:
        {
          stylix = {
            enable = true;
            overlays.enable = false;
            base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.scheme}.yaml";
            cursor = {
              name = "breeze_cursors";
              package = pkgs.kdePackages.breeze;
              size = cfg.cursorSize;
            };
          };
        }
      )
    ];
  };
}