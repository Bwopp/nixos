{ config, lib, inputs, ... }:
let
  cfg = config.features.sonora;
in
{
  options.features.sonora.enable = lib.mkEnableOption "Sonora music streaming client";

  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [
      (
        { config, ... }:
        let
          c = config.lib.stylix.colors;
        in
        {
          imports = [ inputs.sonora.homeManagerModules.default ];

          programs.sonora = {
            enable = true;
            settings = {
              gapless = true;
              appearance = {
                theme = "dark";
                adaptive_theme = false;
                theme_overrides = {
                  background = "#${c.base00}";
                  foreground = "#${c.base05}";
                  border = "#${c.base03}66";
                  muted = "#${c.base02}";
                  muted_foreground = "#${c.base04}";
                  overlay = "#0000008c";
                  overlay_foreground = "#${c.base05}";
                  secondary = "#${c.base02}";
                  secondary_hover = "#${c.base03}66";
                  secondary_active = "#${c.base03}66";
                  popover = "#${c.base01}";
                  popover_foreground = "#${c.base05}";
                  primary = "#${c.base0D}";
                  primary_foreground = "#${c.base01}";
                  primary_hover = "#${c.base0D}b3";
                  danger = "#${c.base08}";
                  danger_foreground = "#${c.base01}";
                  danger_hover = "#${c.base08}b3";
                  progress_bar = "#${c.base0D}";
                  selection = "#${c.base0D}";
                  sidebar = "#${c.base01}";
                  sidebar_accent = "#${c.base0D}40";
                  sidebar_border = "#00000033";
                  title_bar_border = "#00000033";
                  table_head = "#${c.base01}e6";
                  table_head_foreground = "#${c.base04}";
                  table_row_border = "#${c.base02}b3";
                  table_hover = "#${c.base03}66";
                  table_active = "#${c.base0D}33";
                  table_active_border = "#${c.base0D}";
                };
              };
            };
          };
        }
      )
    ];
  };
}