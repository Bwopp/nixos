{ ... }:
{
  programs.niri.settings = {
    input = {
      focus-follows-mouse.enable = false;
      keyboard = {
        xkb = {
          layout = "nz";
        };
      };

      touchpad = {
        tap = true;
        natural-scroll = true;
        dwt = true;
        accel-speed = 0.5;
        accel-profile = "flat";
        click-method = "clickfinger";
      };

      mouse = {
        accel-speed = -0.5;
        accel-profile = "flat";
      };
    };

    switch-events = {
      lid-close.action.spawn = [ "noctalia" "msg" "session" "lock-and-suspend" ];
    };
  };
}