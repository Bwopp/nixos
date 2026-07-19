{ pkgs, ... }:
{
  systemd.services.xray-client = {
    description = "Xray client (VLESS/XHTTP stealth tunnel, tun mode)";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    path = [ pkgs.iproute2 ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.xray}/bin/xray run -c /home/bwop/.config/xray/config.json";
      ExecStartPost = pkgs.writeShellScript "xray-tun-routes-up" ''
        sleep 1
        ip route add 0.0.0.0/1 dev xray-tun0
        ip route add 128.0.0.0/1 dev xray-tun0
      '';
      ExecStopPost = pkgs.writeShellScript "xray-tun-routes-down" ''
        ip route del 0.0.0.0/1 dev xray-tun0 2>/dev/null || true
        ip route del 128.0.0.0/1 dev xray-tun0 2>/dev/null || true
      '';
      Restart = "on-failure";
      RestartSec = 3;
      PrivateTmp = true;
      ReadOnlyPaths = [ "/home/bwop/.config/xray" ];
    };
  };
}