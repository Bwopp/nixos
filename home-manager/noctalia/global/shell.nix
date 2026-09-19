{
  shell = {
    app_icon_colorize = false;
    avatar_path = "/home/bwop/Pictures/cat.png";
    button_borders = true;
    card_borders = true;
    clipboard_auto_paste = "auto";
    clipboard_confirm_clear_history = true;
    clipboard_enabled = true;
    clipboard_history_max_entries = 100;
    clipboard_image_action_command = "";
    clipboard_keep_from_closed_apps = true;
    corner_radius_scale = 1.0;
    date_format = "%A, %x";
    disable_mipmaps = false;
    external_ip_enabled = false;
    font_family = "sans-serif";
    input_borders = true;
    launch_apps_as_systemd_services = false;
    launch_apps_custom_command = "";
    niri_overview_type_to_launch_enabled = true;
    umbriel_overview_type_to_launch_enabled = true;
    offline_mode = false;
    panel_anchor_bar = "widgets";
    password_style = "default";
    polkit_agent = true;
    popup_borders = true;
    popup_shadows = true;
    screen_time_enabled = false;
    settings_show_advanced = true;
    setup_wizard_enabled = true;
    shared_gl_context = true;
    show_location = true;
    telemetry_enabled = false;
    time_format = "{:%H:%M}";
    
    animation = {
      enabled = true;
      speed = 1.0;
    };

    greeter_sync = {
      auto_sync = true;
    };

    mpris.blacklist = [ ];

    launcher = {
      app_grid = false;
      auto_paste = "auto";
      categories = false;
      compact = true;
      fetch_exchange_rates = true;
      provider_prefix = "/";
      show_icons = true;
      sort_by_usage = true;
      dmenu = { };
      providers = {
        session = {
          global = true;
          prefix = "";
        };
      };
    };

    panel = {
      borders = true;
      clipboard_placement = "floating";
      clipboard_position = "center";
      control_center_placement = "attached";
      control_center_position = "auto";
      floating_offset = 8;
      launcher_placement = "floating";
      launcher_position = "center";
      list_item_background = false;
      open_near_click_clipboard = false;
      open_near_click_control_center = false;
      open_near_click_launcher = false;
      open_near_click_session = false;
      open_near_click_wallpaper = false;
      polkit_placement = "floating";
      polkit_position = "center";
      session_placement = "attached";
      session_position = "auto";
      shadow = false;
      transparency_mode = "solid";
      wallpaper_placement = "floating";
      wallpaper_position = "center";
    };

    privacy = {
      cam_filter_regex = "";
      mic_filter_regex = "";
      screen_filter_regex = "";
    };

    screen_corners = {
      enabled = false;
      size = 32;
    };

    screenshot = {
      confirm_region = false;
      copy_to_clipboard = true;
      directory = "~/Pictures/Screenshots";
      filename_pattern = "";
      freeze_screen = true;
      pipe_command = "";
      pipe_to_command = false;
      save_to_file = true;
      show_cursor = false;
    };

    session = {
      grid = false;
      grid_columns = 3;
      show_shortcuts = true;
      power = { };
      actions = [
        {
          action = "lock";
          command = "";
          countdown_seconds = 0.0;
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "1";
          variant = "default";
        }
        {
          action = "logout";
          command = "";
          countdown_seconds = 0.0;
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "2";
          variant = "default";
        }
        {
          action = "lock_and_suspend";
          command = "";
          countdown_seconds = 0.0;
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "3";
          variant = "default";
        }
        {
          action = "reboot";
          command = "";
          countdown_seconds = 0.0;
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "4";
          variant = "default";
        }
        {
          action = "shutdown";
          command = "";
          countdown_seconds = 0.0;
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "5";
          variant = "destructive";
        }
      ];
    };

    shadow = {
      alpha = 0.0;
      direction = "down";
    };
  };
}