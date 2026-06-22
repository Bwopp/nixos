{ pkgs, ... }:
{
  # File Sharing
  programs.localsend.enable = true;

  # File manager stuff
  services.gvfs.enable = true;
  services.samba-wsdd.enable = true;
  services.udisks2.enable = true;

  # Keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    login.enableGnomeKeyring = true;
    noctalia-greeter.enableGnomeKeyring = true;
  };
  
  # Make noctalia polkit work again
  security.polkit.enablePkexecWrapper = true;

  # Power management
  services.power-profiles-daemon.enable = true;

  # Disable waiting for netowork on boot
  systemd.services.NetworkManager-wait-until-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  # ssh
  services.openssh.enable = false;

  # Tailscale
  # services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";

  # Warp
  services.cloudflare-warp.enable = true;
  services.cloudflare-warp.openFirewall = true;

  # Good stuff
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # btrfs autoscrub
  services.btrfs.autoScrub.interval = "monthly";

  # Firewall
  networking.nftables.enable = true;
  # networking.firewall.enable = false;
  networking.firewall.trustedInterfaces = [ "p2p-wl+" ];

  # Syncthing
  services.syncthing = {
    openDefaultPorts = true;
    user = "bwop";
    configDir = "/home/bwop/.config/syncthing";
  };

  # User
  users.users.bwop = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Bwop";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
      "render"
    ];
  };
}