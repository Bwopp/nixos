{ config, ... }:
let
  colours = config.lib.stylix.colors;
in
{
  colors = {
    background = "#${colours.base00}FF";
    text_primary = "#${colours.base05}FF";
    text_muted = "#${colours.base03}FF";
    
    accent_primary = "#${colours.base0D}FF";
    accent_secondary = "#${colours.base0E}FF";
    warning = "#${colours.base0A}FF";
    error = "#${colours.base08}FF";
    
    insert_hint = "#${colours.base0D}80";
    backdrop = "#000000FF";
    shadow = "#0000007F";

    border = {
      focused = "#${colours.base0D}FF";
      unfocused = "#${colours.base01}FF";
      scratchpad_focused = "#${colours.base0A}FF";
      scratchpad_unfocused = "#${colours.base02}FF";
      outer = "#${colours.base00}FF";
    };

    overview = {
      background_tint = "#${colours.base00}30";
      workspace_background = "#00000044";
      badge = "#${colours.base0D}FF";
    };
  };
}