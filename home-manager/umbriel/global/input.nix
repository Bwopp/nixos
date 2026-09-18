{
  input = {
    focus.follows_mouse = false;
    keyboard = {
      layout = "nz";
    };
    touchpad = {
      tap = true;
      natural_scroll = true;
      disable_while_typing = true;
      sensitivity = 0.5;
      accel_profile = "flat";
      click_method = "clickfinger";
    };
    mouse = {
      sensitivity = -0.5;
      accel_profile = "flat";
    };
  };

  events = {
    lid_close = "noctalia msg session lock-and-suspend";
  };
}