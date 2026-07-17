{ pkgs, ... }:
{
  systemd.services.xray-client = {
    description = "Xray client (VLESS/XHTTP stealth tunnel)";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    # Not started automatically — toggle manually via systemctl
    # wantedBy = [ "multi-user.target" ];  # uncomment for auto-start on boot

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.xray}/bin/xray run -c /home/bwop/.config/xray/config.json";
      Restart = "on-failure";
      RestartSec = 3;

      User = "bwop";
      Group = "users";

      # Hardening — safe defaults for a proxy client with no special network needs yet.
      # If you later add a tun inbound for full-system routing, you'll need to relax
      # PrivateNetwork/NoNewPrivileges and add AmbientCapabilities = [ "CAP_NET_ADMIN" ] instead.
      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      ProtectHome = "read-only";
      ReadOnlyPaths = [ "/home/bwop/.config/xray" ];
    };
  };
}