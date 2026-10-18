{ config, lib, pkgs, ... }:
{
  options.features.sing-box.enable = lib.mkEnableOption "sing-box";

  config = lib.mkIf config.features.sing-box.enable {
    environment.systemPackages = with pkgs; [
      sing-box
    ];

    systemd.services.sing-box = {
      description = "sing-box";
      after = [ "network.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.sing-box}/bin/sing-box run -c /home/bwop/.config/sing-box/config.json";
        Restart = "on-failure";
        RestartSec = "5s";
        User = "root";
      };
    };
  };
}
