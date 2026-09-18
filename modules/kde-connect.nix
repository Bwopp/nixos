{ pkgs, ... }:
{
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    glib
    sshfs
  ];
}