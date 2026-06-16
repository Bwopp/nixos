{ config, pkgs, inputs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    cursor = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
      size = 20;
    };
  };
}