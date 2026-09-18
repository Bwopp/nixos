{ ... }:
{
  lockscreen_widgets = {
    enabled = true;
    schema_version = 2;
    widget_order = [
      "lockscreen-login-box@DP-4"
      "lockscreen-login-box@DP-3"
      "lockscreen-widget-0000000000000002"
      "lockscreen-widget-0000000000000003"
      "lockscreen-widget-0000000000000005"
      "lockscreen-widget-0000000000000006"
    ];
    grid = {
      cell_size = 16;
      major_interval = 4;
      visible = true;
    };
    widget."lockscreen-login-box@DP-3" = {
      box_height = 229.0;
      box_width = 810.0;
      cx = 1280.0;
      cy = 720.0;
      enabled = true;
      output = "DP-3";
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
    widget."lockscreen-login-box@DP-4" = {
      box_height = 229.0;
      box_width = 810.0;
      cx = 960.0;
      cy = 540.0;
      enabled = true;
      output = "DP-4";
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
    widget."lockscreen-widget-0000000000000002" = {
      box_height = 0.0;
      box_width = 0.0;
      cx = 1280.0;
      cy = 465.0;
      enabled = true;
      output = "DP-3";
      rotation = 0.0;
      type = "clock";
      settings = {
        background = false;
      };
    };
    widget."lockscreen-widget-0000000000000003" = {
      box_height = 0.0;
      box_width = 0.0;
      cx = 960.0;
      cy = 347.0;
      enabled = true;
      output = "DP-4";
      rotation = 0.0;
      type = "clock";
      settings = {
        background = false;
      };
    };
    widget."lockscreen-widget-0000000000000005" = {
      box_height = 0.0;
      box_width = 0.0;
      cx = 1280.0;
      cy = 982.0;
      enabled = true;
      output = "DP-3";
      rotation = 0.0;
      type = "media_player";
      settings = { };
    };
    widget."lockscreen-widget-0000000000000006" = {
      box_height = 0.0;
      box_width = 0.0;
      cx = 960.0;
      cy = 802.0;
      enabled = true;
      output = "DP-4";
      rotation = 0.0;
      type = "media_player";
      settings = { };
    };
  };
}