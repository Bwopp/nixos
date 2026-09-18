{ config, ... }:
{
  outputs = {
    "eDP-1" = {
      mode = {
        width = 3000;
        height = 1876;
        refresh = 120.001;
      };
      scale = 1.7166666666666666;
      backdrop-color = "#${config.lib.stylix.colors.base00}";
      background-color = "#${config.lib.stylix.colors.base00}";
    };
  };
}