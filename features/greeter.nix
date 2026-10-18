{ config, lib, pkgs, inputs, ... }:
{
  options.features.greeter.enable = lib.mkEnableOption "greeter";

  config = lib.mkIf config.features.greeter.enable {
    imports = [ inputs.noctalia-greeter.nixosModules.default ];
    services.displayManager.noctalia-greeter = {
      enable = true;
      package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

      greeter-args = "--user bwop";
      settings = {
        user.default = "bwop";
        appearance = {
          scheme = "Synced";
          hide_logo = true;
        };
        cursor = {
          theme = "breeze_cursors";
          size = 20;
          path = "${pkgs.kdePackages.breeze}/share/icons";
        };
        idle.timeout = 300;
      };
    };
  };
}
