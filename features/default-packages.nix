{ config, lib, pkgs, ... }:
{
  options.features.default-packages.enable = lib.mkEnableOption "default-packages";

  config = lib.mkIf config.features.default-packages.enable {
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
