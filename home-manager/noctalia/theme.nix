{ config, ... }:
let
  c = config.lib.stylix.colors;
in
{
  stylix.targets.noctalia.enable = false;
  home.file.".config/noctalia/palettes/stylix.json".text = builtins.toJSON {
    dark = {
      mPrimary = "#${c.base0D}";
      mOnPrimary = "#${c.base00}";
      mSecondary = "#${c.base0E}";
      mOnSecondary = "#${c.base00}";
      mTertiary = "#${c.base0B}";
      mOnTertiary = "#${c.base00}";
      mError = "#${c.base08}";
      mOnError = "#${c.base00}";
      mSurface = "#${c.base00}";
      mOnSurface = "#${c.base06}";
      mSurfaceVariant = "#${c.base01}";
      mOnSurfaceVariant = "#${c.base04}";
      mOutline = "#${c.base03}";
      mShadow = "#${c.base00}";
      mHover = "#${c.base0B}";
      mOnHover = "#${c.base00}";
      terminal = {
        foreground = "#${c.base06}";
        background = "#${c.base00}";
        cursor = "#${c.base06}";
        cursorText = "#${c.base00}";
        selectionFg = "#${c.base06}";
        selectionBg = "#${c.base02}";
        normal = {
          black = "#${c.base00}";
          red = "#${c.base08}";
          green = "#${c.base0B}";
          yellow = "#${c.base0A}";
          blue = "#${c.base0D}";
          magenta = "#${c.base0E}";
          cyan = "#${c.base0C}";
          white = "#${c.base05}";
        };
        bright = {
          black = "#${c.base03}";
          red = "#${c.base08}";
          green = "#${c.base0B}";
          yellow = "#${c.base0A}";
          blue = "#${c.base0D}";
          magenta = "#${c.base0E}";
          cyan = "#${c.base0C}";
          white = "#${c.base06}";
        };
      };
    };
    light = {
      mPrimary = "#${c.base0D}";
      mOnPrimary = "#${c.base07}";
      mSecondary = "#${c.base0E}";
      mOnSecondary = "#${c.base07}";
      mTertiary = "#${c.base0B}";
      mOnTertiary = "#${c.base07}";
      mError = "#${c.base08}";
      mOnError = "#${c.base07}";
      mSurface = "#${c.base07}";
      mOnSurface = "#${c.base0D}";
      mSurfaceVariant = "#${c.base06}";
      mOnSurfaceVariant = "#${c.base04}";
      mOutline = "#${c.base05}";
      mShadow = "#${c.base05}";
      mHover = "#${c.base0B}";
      mOnHover = "#${c.base07}";
      terminal = {
        foreground = "#${c.base0D}";
        background = "#${c.base07}";
        cursor = "#${c.base0D}";
        cursorText = "#${c.base07}";
        selectionFg = "#${c.base0D}";
        selectionBg = "#${c.base05}";
        normal = {
          black = "#${c.base07}";
          red = "#${c.base08}";
          green = "#${c.base0B}";
          yellow = "#${c.base0A}";
          blue = "#${c.base0D}";
          magenta = "#${c.base0E}";
          cyan = "#${c.base0C}";
          white = "#${c.base04}";
        };
        bright = {
          black = "#${c.base05}";
          red = "#${c.base08}";
          green = "#${c.base0B}";
          yellow = "#${c.base0A}";
          blue = "#${c.base0D}";
          magenta = "#${c.base0E}";
          cyan = "#${c.base0C}";
          white = "#${c.base0D}";
        };
      };
    };
  };
}