{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    prismlauncher
    obsidian
    spotify
    btop
    fastfetch
    qbittorrent
    element-desktop
    blender
    nixd
    devenv
    brave-origin
    libreoffice
  ];
}