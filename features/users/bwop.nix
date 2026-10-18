{ config, lib, ... }:
let
  cfg = config.features.user-bwop;
in
{
  options.features.user-bwop = {
    enable = lib.mkEnableOption "user bwop";
    homeManager.enable = lib.mkEnableOption "home-manager for bwop" // { default = true; };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      users.users.bwop = {
        isNormalUser = true;
        description = "Bwop";
        extraGroups = [ "networkmanager" "wheel" "video" "input" "render" ];
      };
    })

    (lib.mkIf (cfg.enable && cfg.homeManager.enable) {
      home-manager.users.bwop = {
        home = {
          username = "bwop";
          homeDirectory = "/home/bwop";
          stateVersion = "25.05";
        };
        programs.home-manager.enable = true;
      };
    })
  ];
}