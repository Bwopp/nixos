{ config, lib, pkgs, ... }:
{
  options.features.gnome-apps.enable = lib.mkEnableOption "gnome-apps";

  config = lib.mkIf config.features.gnome-apps.enable {
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

    home-manager.sharedModules = [
      (
        { ... }:
        {
          xdg.desktopEntries."org.gnome.Nautilus" = {
            name = "Files";
            exec = "nautilus --new-window";
            icon = "org.gnome.Nautilus";
            terminal = false;
            categories = [ "GNOME" "GTK" "Utility" "Core" ];
            mimeType = [ "inode/directory" ];
            settings.DBusActivatable = "false";
          };
        }
      )
    ];
  };
}