{
  general = {
    xwayland = true;
    autostart = [
      "noctalia"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    ];
    show_cheatsheet = false;
  };

  appearance.prefer_no_csd = true;
}