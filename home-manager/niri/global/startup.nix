{ ... }:
{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "noctalia" ]; }
    { command = [ "dbus-update-activation-environment" "--systemd" "WAYLAND_DISPLAY" "XDG_CURRENT_DESKTOP" ]; }
  ];
}