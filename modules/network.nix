{ config, pkgs, inputs,lib, ... }:
{
  networking = {
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    networkmanager = {
      wifi.backend = "wpa_supplicant";
      enable = true;
      # dns = "none";
    };
  };
}