{ config, pkgs, inputs, ... }:
{
  programs.noctalia = {
    enable = true;
    settings = {
      backdrop = {
        blur_intensity = 0.0;
        tint_intensity = 0.0;
      };

      bar.widgets = {
        center = [ "workspaces" ];
        end = [ "tray" "brightness" "power_profile" "battery" "clock" ];
        margin_edge = 0;
        margin_ends = 0;
        padding = 10;
        radius = 0;
        start = [ "control-center" "network" "bluetooth" "media" ];
      };

      desktop_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [ "desktop-widget-0000000000000001" ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget."desktop-widget-0000000000000001" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 1549.0;
          cy = 988.5;
          output = "eDP-1";
          rotation = 0.0;
          type = "media_player";
        };
      };

      location = {
        address = "Auckland, New Zealand";
      };

      lockscreen = {
        blur_intensity = 0.0;
      };

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [ "lockscreen-login-box@eDP-1" ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget."lockscreen-login-box@eDP-1" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 874.0;
          cy = 970.0;
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
      };

      osd = {
        orientation = "vertical";
      };

      plugins = {
        enabled = [];
      };

      shell = {
        avatar_path = "/home/bwop/Pictures/cat.png";
        polkit_agent = true;
        settings_show_advanced = true;
      };

      theme = {
        builtin = "Tokyo-Night";
        templates.builtin_ids = [ "alacritty" "gtk3" "gtk4" "niri" "qt" ];
      };

      wallpaper = {
        default.path = "/home/bwop/Pictures/walls/nix.jpg";
        last.path = "/home/bwop/Pictures/walls/nix.jpg";
        monitors."eDP-1".path = "/home/bwop/Pictures/walls/nix.jpg";
      };

      widget = {
        battery = {
          device = "/org/freedesktop/UPower/devices/battery_BAT1";
          display_mode = "graphic";
          show_label = false;
        };

        brightness = {
          show_label = false;
        };

        custom_button_2 = {
          type = "custom_button";
        };

        network = {
          show_label = false;
        };

        tray = {
          hidden = [ "Zero Trust Client" ];
        };

        workspaces = {
          display = "none";
        };
      };
    };
  };
}