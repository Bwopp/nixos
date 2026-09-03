{ pkgs, ... }:
{
  # Avahi for mDNS/DNS-SD discovery — required by gnome-network-displays
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };

  # PipeWire for screen capture backend
  services.pipewire = {
    enable = true;
    pipewire.enable = true;
  };

  # WiFi Direct / P2P support for Miracast negotiation
  networking.networkmanager.wifi.powersave = false;

  environment.systemPackages = with pkgs; [
    gnome-network-displays
    wpa_supplicant
  ];

  # Firewall: Miracast/WFD uses RTSP (7236) and RTP streaming ports
  networking.firewall = {
    allowedTCPPorts = [ 7236 7250 ];
    allowedUDPPorts = [ 7236 7250 ];
  };
}