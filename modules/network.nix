{ ... }:
{
  networking = {
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    firewall = {
      checkReversePath = "loose";
      trustedInterfaces = [ "tun0" ];
    };
    networkmanager = {
      wifi.backend = "wpa_supplicant";
      enable = true;
      # dns = "none";
    };
  };
}