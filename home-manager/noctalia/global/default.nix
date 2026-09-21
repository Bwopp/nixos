{
  accessibility = {
    high_contrast = false;
    ui_scale = 1.0;
  };

  audio = {
    enable_overdrive = false;
    enable_sounds = false;
    sound_volume = 0.5;
  };

  calendar = {
    enabled = true;
    refresh_minutes = 15;
    event_date_format = "%A %e %B";
    event_time_format = "%H:%M";
    account = {
      personal_google = {
        calendars = [ ];
        color = "";
        credential_source = "secret-service";
        name = "";
        password_file = "";
        provider = "";
        server_url = "";
        type = "google";
        username = "";
      };
    };
  };

  backdrop = {
    blur_intensity = 0.0;
    enabled = false;
    tint_intensity = 0.0;
  };

  battery = {
    warning_threshold = 20;
  };

  brightness = {
    enable_ddcutil = false;
    ignore_mmids = [ ];
    minimum_brightness = 0.0;
    sync_all_monitors = false;
  };

  desktop_widgets = {
    enabled = false;
    schema_version = 2;
    grid = {
      cell_size = 16;
      major_interval = 4;
      visible = true;
    };
  };

  dock = {
    enabled = false;
  };

  hooks = {
    battery_charging = [ ];
    battery_discharging = [ ];
    battery_percentage_changed = [ ];
    battery_plugged = [ ];
    bluetooth_disabled = [ ];
    bluetooth_enabled = [ ];
    colors_changed = [ ];
    logging_out = [ ];
    power_profile_changed = [ ];
    rebooting = [ ];
    session_locked = [ ];
    session_unlocked = [ ];
    shutting_down = [ ];
    started = [ ];
    theme_mode_changed = [ ];
    wallpaper_changed = [ ];
    wifi_disabled = [ ];
    wifi_enabled = [ ];
  };

  hot_corners = {
    enabled = false;
  };

  keybinds = {
    cancel = [ "Escape" ];
    down = [ "Down" ];
    left = [ "Left" ];
    right = [ "Right" ];
    tab_next = [ "Tab" ];
    tab_previous = [ "Shift+ISO_Left_Tab" ];
    up = [ "Up" ];
    validate = [
      "Return"
      "KP_Enter"
    ];
  };

  location = {
    address = "Auckland, New Zealand";
    auto_locate = false;
    custom_schedule = false;
    sunrise = "";
    sunset = "";
  };

  lockscreen = {
    allow_empty_password = false;
    blur_intensity = 0.0;
    blurred_desktop = false;
    enabled = true;
    fingerprint = false;
    monitors = [ ];
    tint_intensity = 0.30000001192092896;
    wallpaper = "";
  };

  nightlight = {
    enabled = false;
    force = false;
    temperature_day = 6500;
    temperature_night = 4000;
  };

  notification = {
    background_opacity = 0.97000002861022949;
    border = true;
    collapse_on_dismiss = true;
    enable_daemon = true;
    history_retention_hours = 0;
    layer = "top";
    monitors = [ ];
    offset_x = 20;
    offset_y = 8;
    position = "top_right";
    scale = 1.0;
    show_actions = true;
    show_app_name = true;
  };

  storage = {
    key_file = "";
    key_source = "secret-service";
  };

  weather = {
    effects = true;
    enabled = true;
    refresh_minutes = 30;
    unit = "metric";
  };
}