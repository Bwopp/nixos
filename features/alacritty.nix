{ config, lib, pkgs, ... }:
{
  options.features.alacritty.enable = lib.mkEnableOption "alacritty";

  config = lib.mkIf config.features.alacritty.enable {
    environment.systemPackages = [ pkgs.alacritty ];
    home-manager.sharedModules = [
      (
        { ... }:
        {
          programs.alacritty = {
            enable = true;
            settings = {
              window.padding = {
                x = 8;
                y = 8;
              };
            };
          };
        }
      )
    ];
  };
}

