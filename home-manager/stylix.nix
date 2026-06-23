{ pkgs, hostName, ... }:
let
  hostCursorSize = {
    "nixos" = 20;
    "12600k-nix" = 24;
  };
in
{
  stylix = {
    enable = true;
    overlays.enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    cursor = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
      size = hostCursorSize.${hostName};
    };
  };
}
