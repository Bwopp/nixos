{ config, lib, ... }:
{
  outputs = {
    "DP-3" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 144.0;
      };
      scale = 1.0;
      position = { x = 0; y = 0; };
      backdrop-color = "#${config.lib.stylix.colors.base00}";
      background-color = "#${config.lib.stylix.colors.base00}";
    };
    "DP-4" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 60.0;
      };
      scale = 1.0;
      position = { x = 2560; y = 0; };
      backdrop-color = "#${config.lib.stylix.colors.base00}";
      background-color = "#${config.lib.stylix.colors.base00}";
    };
  };
}