{
  lockscreen_widgets = {
    enabled = true;
    schema_version = 2;
    widget_order = [
      "lockscreen-login-box@eDP-1"
      "lockscreen-widget-0000000000000001"
      "lockscreen-widget-0000000000000002"
    ];
    grid = {
      cell_size = 16;
      major_interval = 4;
      visible = true;
    };
    widget."lockscreen-login-box@eDP-1" = {
      box_height = 229.0;
      box_width = 810.0;
      cx = 874.0;
      cy = 546.5;
      enabled = true;
      output = "eDP-1";
      rotation = 0.0;
      type = "login_box";
      settings = {
        background_color = "surface_variant";
        background_opacity = 0.88;
        background_radius = 12.0;
        center_password_text = false;
        input_opacity = 1.0;
        input_radius = 6.0;
        layout = "regular";
        show_caps_lock = true;
        show_keyboard_layout = false;
        show_login_button = true;
        show_media = false;
        show_session_buttons = true;
        show_weather = false;
        show_unlock_hint = false;
      };
    };
    widget."lockscreen-widget-0000000000000001" = {
      box_height = 128.0;
      box_width = 208.0;
      cx = 874.0;
      cy = 290.5;
      enabled = true;
      output = "eDP-1";
      rotation = 0.0;
      type = "clock";
      settings = {
        background = false;
      };
    };
    widget."lockscreen-widget-0000000000000002" = {
      box_height = 0.0;
      box_width = 0.0;
      cx = 874.0;
      cy = 808.5;
      enabled = true;
      output = "eDP-1";
      rotation = 0.0;
      type = "media_player";
      settings = { };
    };
  };
}