{ config, lib, ... }:
{
  options.features.network.enable = lib.mkEnableOption "network";

  config = lib.mkIf config.features.network.enable {
    networking = {
      nftables.enable = true;
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
      firewall = {
        checkReversePath = "loose";
        trustedInterfaces = [ "tun0" "p2p-wl+" ];
      };
      networkmanager = {
        wifi.backend = "wpa_supplicant";
        enable = true;
        # dns = "none";
      };
    };
    systemd.services.NetworkManager-wait-until-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;
  };
}
