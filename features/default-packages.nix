{ config, lib, pkgs, ... }:
{
  options.features.base-packages.enable = lib.mkEnableOption "base-packages";

  config = lib.mkIf config.features.base-packages.enable {
    environment.systemPackages = with pkgs; [
      wget
      wl-clipboard
      brightnessctl
      cliphist
      kdePackages.breeze
      adwaita-icon-theme
      ffmpeg-full
      gcr_4
      seahorse
      mpv
      libqalculate
      gnome-calculator
      playerctl
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
    
    programs.localsend.enable = true;
  };
}
