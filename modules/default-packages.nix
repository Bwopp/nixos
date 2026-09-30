{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    alacritty
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
  ];
}