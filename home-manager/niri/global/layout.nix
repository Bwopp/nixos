{ config, ... }:
{
  programs.niri.settings.layout = {
    struts = {
      left = 0;
      right = 0;
      top = 0;
      bottom = 0;
    };
    gaps = 5;
    focus-ring = {
      width = 1;
      active.color = "#${config.lib.stylix.colors.base0D}";
    };
    center-focused-column = "never";
    preset-column-widths = [
      { proportion = 0.33333; }
      { proportion = 0.5; }
      { proportion = 0.66667; }
    ];
    default-column-width = {
      proportion = 0.5;
    };
  };
}