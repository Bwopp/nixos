{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    alacritty
    gparted
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
    playerctl
  ];
}