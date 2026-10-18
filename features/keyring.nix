{ config, lib, ... }:
{
  options.features.keyring.enable = lib.mkEnableOption "keyring";

  config = lib.mkIf config.features.keyring.enable {
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
  };
}