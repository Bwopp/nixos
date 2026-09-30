{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nautilus
    loupe
    file-roller
    gnome-text-editor
    papers
    gnome-disk-utility
  ];
  services = {
    gnome.sushi.enable = true;
    gvfs.enable = true;
    samba-wsdd.enable = true;
    udisks2.enable = true;
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };
}