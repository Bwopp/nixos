{ config, lib, inputs, ... }:
let
  cfg = config.features.luciole;
in
{
  options.features.luciole = {
    enable = lib.mkEnableOption "luciole";

    overrides = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
      description = "luciole";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [
      inputs.luciole.homeModules.default
      (
        { config, pkgs, ... }:
        let
          c = config.lib.stylix.colors.withHashtag;

          palette = {
            primary = c.base0D;
            on_primary = c.base00;
            primary_container = c.base02;
            on_primary_container = c.base05;

            secondary = c.base0E;
            on_secondary = c.base00;
            secondary_container = c.base02;
            on_secondary_container = c.base05;

            tertiary = c.base0C;
            on_tertiary = c.base00;
            tertiary_container = c.base02;
            on_tertiary_container = c.base05;

            error = c.base08;
            on_error = c.base00;
            error_container = c.base01;
            on_error_container = c.base08;

            surface = c.base00;
            on_surface = c.base05;
            on_surface_variant = c.base04;
            surface_container_low = c.base01;
            surface_container = c.base01;
            surface_container_high = c.base02;
            surface_container_highest = c.base03;
            outline_variant = c.base03;

            shadow = c.base00;
            scrim = c.base00;
            hover = c.base02;
            on_hover = c.base05;
          };
        in
        {
          programs.luciole = {
            enable = true;
            settings = {
              browser = {
                directories_first = false;
                expandable_folders = true;
                filename_truncation = "end";
                sort_by = "modified";
              };
            };
          };

          home.file.".config/luciole/colors.toml".source =
            (pkgs.formats.toml { }).generate "luciole-colors.toml" {
              colors = palette // cfg.overrides;
            };
        }
      )
    ];
  };
}