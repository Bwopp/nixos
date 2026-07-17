{ config, hostName, ... }:
let
  c = config.lib.stylix.colors;

  # hostBool.${hostName}.true;
  # true for laptop false for desktop
  # hostBool.${hostName}.false
  # false for laptop true for desktop
  hostBool = {
    "nixos" = {
      true = true;
      false = false;
    };
    "12600k-nix" = {
      true = false;
      false = true;
    };
  };

  hostLockWidgets = {
    "nixos" = {
      enabled = true;
      schema_version = 2;
      widget_order = [
        "lockscreen-login-box@eDP-1"
        "lockscreen-widget-0000000000000001"
      ];
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      widget."lockscreen-login-box@eDP-1" = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 874.0;
        cy = 562.5;
        enabled = true;
        output = "eDP-1";
        rotation = 0.0;
        type = "login_box";
        settings = {
          background_color = "surface_variant";
          background_opacity = 0.88;
          background_radius = 12.0;
          input_opacity = 1.0;
          input_radius = 6.0;
          show_login_button = true;
        };
      };
      widget."lockscreen-widget-0000000000000001" = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 874.0;
        cy = 417.5;
        enabled = true;
        output = "eDP-1";
        rotation = 0.0;
        type = "clock";
        settings = { };
      };
    };
    "12600k-nix" = {
      enabled = true;
      schema_version = 2;
      widget_order = [
        "lockscreen-login-box@DP-4"
        "lockscreen-login-box@DP-3"
        "lockscreen-widget-0000000000000002"
        "lockscreen-widget-0000000000000003"
      ];
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      widget."lockscreen-login-box@DP-3" = {
        box_height = 0.0;
        box_width = 0.0;
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
          input_opacity = 1.0;
          input_radius = 6.0;
          show_login_button = true;
        };
      };
      widget."lockscreen-login-box@DP-4" = {
        box_height = 0.0;
        box_width = 0.0;
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
          input_opacity = 1.0;
          input_radius = 6.0;
          show_login_button = true;
        };
      };
      widget."lockscreen-widget-0000000000000002" = {
        box_height = 0.0;
        box_width = 0.0;
        cx = 1280.0;
        cy = 587.0;
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
        cy = 407.0;
        enabled = true;
        output = "DP-4";
        rotation = 0.0;
        type = "clock";
        settings = {
          background = false;
        };
      };
    };
  };
in
{
  programs.noctalia = {
    enable = true;
    settings = {
      audio = {
        enable_overdrive = false;
        enable_sounds = false;
        notification_sound = "";
        sound_volume = 0.5;
        volume_change_sound = "";
      };

      calendar = {
        enabled = true;
        refresh_minutes = 15;
        account = {
          personal_google = {
            calendars = [ ];
            color = "";
            name = "";
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

      bar = {
        order = [ "widgets" ];
        widgets = {
          auto_hide = false;
          background_opacity = 1.0;
          border = "outline";
          border_width = 0.0;
          capsule = false;
          capsule_fill = "surface_variant";
          capsule_group = [ ];
          capsule_opacity = 1.0;
          capsule_padding = 6.0;
          capsule_thickness = 0.75999999046325684;
          center = [ "workspaces" ];
          contact_shadow = false;
          enabled = true;
          end = [
            "tray"
            "brightness"
            "battery"
            "power_profile"
            "clock"
          ];
          font_weight = 500;
          layer = "top";
          margin_edge = 0;
          margin_ends = 0;
          padding = 10;
          panel_overlap = 0;
          position = "top";
          radius = 0;
          radius_bottom_left = 0;
          radius_bottom_right = 0;
          radius_top_left = 0;
          radius_top_right = 0;
          reserve_space = true;
          scale = 1.0;
          shadow = false;
          start = [
            "control-center"
            "network"
            "bluetooth"
            "volume"
            "media"
          ];
          thickness = 30;
          widget_spacing = 4;
        };
      };

      battery = {
        warning_threshold = 20;
      };

      brightness = {
        enable_ddcutil = false;
        ignore_mmids = [ ];
      };

      control_center = {
        sidebar = "compact";
        sidebar_section = "compact";
        shortcuts = [
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "caffeine"; }
          { type = "nightlight"; }
          { type = "notification"; }
          { type = "power_profile"; }
        ];
      };

      desktop_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [ "" ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
      };

      dock = {
        active_monitor_only = false;
        active_opacity = 1.0;
        active_scale = 1.0;
        auto_hide = false;
        background_opacity = 0.87999999523162842;
        cross_axis_padding = 8;
        enabled = false;
        icon_size = 48;
        inactive_opacity = 0.85000002384185791;
        inactive_scale = 0.85000002384185791;
        item_spacing = 6;
        launcher_icon = "grid-dots";
        launcher_position = "none";
        magnification = true;
        magnification_scale = 1.4500000476837158;
        main_axis_padding = 16;
        margin_edge = 8;
        margin_ends = 0;
        monitors = [ ];
        pinned = [ ];
        position = "bottom";
        radius = 16;
        radius_bottom_left = 16;
        radius_bottom_right = 16;
        radius_top_left = 16;
        radius_top_right = 16;
        reserve_space = true;
        shadow = false;
        show_dots = false;
        show_instance_count = true;
        show_running = true;
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

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        pre_action_fade_seconds = 2.0;
        behavior.lock = {
          action = "lock";
          command = "";
          enabled = true;
          resume_command = "";
          timeout = 600;
        };
        behavior."lock-and-suspend" = {
          action = "lock_and_suspend";
          command = "";
          enabled = hostBool.${hostName}.true;
          resume_command = "";
          timeout = 900;
        };
        behavior."screen-off" = {
          action = "screen_off";
          command = "";
          enabled = true;
          resume_command = "";
          timeout = 660;
        };
      };

      keybinds = {
        cancel = [ "Escape" ];
        down = [ "Down" ];
        left = [ "Left" ];
        right = [ "Right" ];
        up = [ "Up" ];
        validate = [
          "Return"
          "KP_Enter"
        ];
      };

      location = {
        address = "Auckland, New Zealand";
        auto_locate = false;
        sunrise = "";
        sunset = "";
      };

      lockscreen = {
        blur_intensity = 0.0;
        blurred_desktop = false;
        enabled = true;
        fingerprint = false;
        monitors = [ ];
        tint_intensity = 0.30000001192092896;
        wallpaper = "";
      };

      lockscreen_widgets = hostLockWidgets.${hostName};

      nightlight = {
        enabled = false;
        force = false;
        temperature_day = 6500;
        temperature_night = 4000;
      };

      notification = {
        background_opacity = 0.97000002861022949;
        collapse_on_dismiss = true;
        enable_daemon = true;
        layer = "top";
        monitors = [ ];
        offset_x = 20;
        offset_y = 8;
        position = "top_right";
        scale = 1.0;
        show_actions = true;
        show_app_name = true;
      };

      osd = {
        background_opacity = 0.97000002861022949;
        monitors = [ ];
        offset_x = 20;
        offset_y = 8;
        orientation = "horizontal";
        position = "top_center";
        scale = 1.0;
        kinds = {
          bluetooth = true;
          brightness = true;
          caffeine = true;
          dnd = true;
          keyboard_layout = true;
          lock_keys = false;
          power_profile = true;
          volume = true;
          volume_input = true;
          volume_output = true;
          wifi = true;
        };
      };

      plugins = {
        enabled = [ ];
        auto_update = true;
        source = [
          {
            enabled = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            name = "official";
          }
          {
            enabled = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            name = "community";
          }
        ];
      };

      shell = {
        app_icon_colorize = false;
        avatar_path = "/home/bwop/Pictures/cat.png";
        clipboard_auto_paste = "auto";
        clipboard_confirm_clear_history = true;
        clipboard_enabled = true;
        clipboard_history_max_entries = 100;
        clipboard_image_action_command = "";
        corner_radius_scale = 1.0;
        date_format = "%A, %x";
        disable_mipmaps = false;
        font_family = "sans-serif";
        launch_apps_as_systemd_services = false;
        middle_click_opens_widget_settings = true;
        niri_overview_type_to_launch_enabled = true;
        offline_mode = false;
        password_style = "default";
        polkit_agent = true;
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

        mpris.blacklist = [ ];

        launcher = {
          categories = false;
          compact = true;
          show_icons = true;
          sort_by_usage = true;
          providers = {
            session = {
              global = true;
              prefix = "";
            };
          };
        };

        panel = {
          borders = true;
          control_center_placement = "attached";
          open_near_click_clipboard = false;
          open_near_click_control_center = false;
          open_near_click_launcher = false;
          open_near_click_session = false;
          open_near_click_wallpaper = false;
          launcher_placement = "floating";
          launcher_position = "center";
          clipboard_placement = "floating";
          clipboard_position = "center";
          session_placement = "attached";
          shadow = false;
          transparency_mode = "solid";
          wallpaper_placement = "attached";
        };

        screen_corners = {
          enabled = false;
          size = 32;
        };

        screenshot = {
          copy_to_clipboard = true;
          directory = "";
          filename_pattern = "";
          freeze_screen = true;
          pipe_command = "";
          pipe_to_command = false;
          save_to_file = true;
        };

        session.actions = [
          {
            action = "lock";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "1";
            variant = "default";
          }
          {
            action = "logout";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "2";
            variant = "default";
          }
          {
            action = "lock_and_suspend";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "3";
            variant = "default";
          }
          {
            action = "reboot";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "4";
            variant = "default";
          }
          {
            action = "shutdown";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "5";
            variant = "destructive";
          }
        ];

        shadow = {
          alpha = 0.0;
          direction = "down";
        };
      };

      system.monitor = {
        cpu_poll_seconds = 2.0;
        cpu_temp_activity_threshold = 60.0;
        cpu_temp_critical_threshold = 85.0;
        cpu_temp_sensor_path = "";
        cpu_usage_activity_threshold = 50.0;
        cpu_usage_critical_threshold = 90.0;
        disk_pct_activity_threshold = 80.0;
        disk_pct_critical_threshold = 95.0;
        disk_poll_seconds = 10.0;
        enabled = true;
        gpu_poll_seconds = 0.0;
        gpu_temp_activity_threshold = 60.0;
        gpu_temp_critical_threshold = 85.0;
        gpu_usage_activity_threshold = 50.0;
        gpu_usage_critical_threshold = 95.0;
        gpu_vram_activity_threshold = 50.0;
        gpu_vram_critical_threshold = 90.0;
        memory_poll_seconds = 2.0;
        net_rx_activity_threshold = 1.0;
        net_rx_critical_threshold = 50.0;
        net_tx_activity_threshold = 1.0;
        net_tx_critical_threshold = 50.0;
        network_poll_seconds = 3.0;
        ram_pct_activity_threshold = 60.0;
        ram_pct_critical_threshold = 90.0;
        swap_pct_activity_threshold = 20.0;
        swap_pct_critical_threshold = 80.0;
      };

      theme = {
        source = "custom";
        custom_palette = "stylix";
      };

      wallpaper = {
        directory = "/home/bwop/Pictures/walls";
        directory_dark = "";
        directory_light = "";
        edge_smoothness = 0.30000001192092896;
        enabled = true;
        fill_color = "";
        fill_mode = "crop";
        per_monitor_directories = false;
        transition = [
          "fade"
          "wipe"
          "disc"
          "stripes"
          "zoom"
          "honeycomb"
        ];
        transition_duration = 1500.0;
        transition_on_startup = false;
        automation = {
          enabled = false;
          interval_seconds = 1800;
          order = "random";
          recursive = true;
        };
      };

      weather = {
        effects = true;
        enabled = true;
        refresh_minutes = 30;
        unit = "metric";
      };

      widget = {
        active_window = {
          icon_size = 14.0;
          max_length = 260.0;
          min_length = 80.0;
          title_scroll = "none";
          type = "active_window";
        };
        battery = {
          device = "/org/freedesktop/UPower/devices/battery_BAT1";
          display_mode = "graphic";
          show_label = true;
          type = "battery";
        };
        brightness = {
          show_label = false;
          type = "brightness";
        };
        control-center = {
          custom_image = "/home/bwop/Pictures/nix.png";
          custom_image_colorize = true;
          type = "control-center";
        };
        cpu = {
          stat = "cpu_usage";
          type = "sysmon";
        };
        custom_button_2 = {
          type = "custom_button";
        };
        date = {
          format = "{:%a %d %b}";
          type = "clock";
        };
        input_volume = {
          device = "input";
          type = "volume";
        };
        keyboard_layout = {
          cycle_command = "";
          hide_when_single_layout = false;
          type = "keyboard_layout";
        };
        lock_keys = {
          display = "short";
          hide_when_off = false;
          show_caps_lock = true;
          show_num_lock = true;
          show_scroll_lock = false;
          type = "lock_keys";
        };
        media = {
          art_size = 16.0;
          max_length = 600.0;
          hide_when_no_media = true;
          min_length = 80.0;
          title_scroll = "on_hover";
          type = "media";
        };
        network = {
          show_label = false;
          type = "network";
        };
        network_rx = {
          stat = "net_rx";
          type = "sysmon";
        };
        network_tx = {
          stat = "net_tx";
          type = "sysmon";
        };
        output_volume = {
          device = "output";
          type = "volume";
        };
        ram = {
          stat = "ram_used";
          type = "sysmon";
        };
        spacer = {
          type = "spacer";
        };
        temp = {
          stat = "cpu_temp";
          type = "sysmon";
        };
        tray = {
          hidden = [ "Zero Trust Client" ];
          type = "tray";
        };
        workspaces = {
          display = "none";
          type = "workspaces";
        };
      };
    };
  };

  stylix.targets.noctalia.enable = false;
  home.file.".config/noctalia/palettes/stylix.json".text = builtins.toJSON {
    dark = {
      mPrimary = "#${c.base0D}";
      mOnPrimary = "#${c.base00}";
      mSecondary = "#${c.base0E}";
      mOnSecondary = "#${c.base00}";
      mTertiary = "#${c.base0B}";
      mOnTertiary = "#${c.base00}";
      mError = "#${c.base08}";
      mOnError = "#${c.base00}";
      mSurface = "#${c.base00}";
      mOnSurface = "#${c.base06}";
      mSurfaceVariant = "#${c.base01}";
      mOnSurfaceVariant = "#${c.base04}";
      mOutline = "#${c.base03}";
      mShadow = "#${c.base00}";
      mHover = "#${c.base0B}";
      mOnHover = "#${c.base00}";
      terminal = {
        foreground = "#${c.base06}";
        background = "#${c.base00}";
        cursor = "#${c.base06}";
        cursorText = "#${c.base00}";
        selectionFg = "#${c.base06}";
        selectionBg = "#${c.base02}";
        normal = {
          black = "#${c.base00}";
          red = "#${c.base08}";
          green = "#${c.base0B}";
          yellow = "#${c.base0A}";
          blue = "#${c.base0D}";
          magenta = "#${c.base0E}";
          cyan = "#${c.base0C}";
          white = "#${c.base05}";
        };
        bright = {
          black = "#${c.base03}";
          red = "#${c.base08}";
          green = "#${c.base0B}";
          yellow = "#${c.base0A}";
          blue = "#${c.base0D}";
          magenta = "#${c.base0E}";
          cyan = "#${c.base0C}";
          white = "#${c.base06}";
        };
      };
    };
    light = {
      mPrimary = "#${c.base0D}";
      mOnPrimary = "#${c.base07}";
      mSecondary = "#${c.base0E}";
      mOnSecondary = "#${c.base07}";
      mTertiary = "#${c.base0B}";
      mOnTertiary = "#${c.base07}";
      mError = "#${c.base08}";
      mOnError = "#${c.base07}";
      mSurface = "#${c.base07}";
      mOnSurface = "#${c.base0D}";
      mSurfaceVariant = "#${c.base06}";
      mOnSurfaceVariant = "#${c.base04}";
      mOutline = "#${c.base05}";
      mShadow = "#${c.base05}";
      mHover = "#${c.base0B}";
      mOnHover = "#${c.base07}";
      terminal = {
        foreground = "#${c.base0D}";
        background = "#${c.base07}";
        cursor = "#${c.base0D}";
        cursorText = "#${c.base07}";
        selectionFg = "#${c.base0D}";
        selectionBg = "#${c.base05}";
        normal = {
          black = "#${c.base07}";
          red = "#${c.base08}";
          green = "#${c.base0B}";
          yellow = "#${c.base0A}";
          blue = "#${c.base0D}";
          magenta = "#${c.base0E}";
          cyan = "#${c.base0C}";
          white = "#${c.base04}";
        };
        bright = {
          black = "#${c.base05}";
          red = "#${c.base08}";
          green = "#${c.base0B}";
          yellow = "#${c.base0A}";
          blue = "#${c.base0D}";
          magenta = "#${c.base0E}";
          cyan = "#${c.base0C}";
          white = "#${c.base0D}";
        };
      };
    };
  };
}
