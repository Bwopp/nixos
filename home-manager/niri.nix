{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  programs.niri.package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  # inputs.niri.packages.${pkgs.system}.niri-unstable;
  # pkgs.niri;
  programs.niri.settings = {
    xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

    # Input configuration
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

    environment = {
      NIRI_BACKGROUND_COLOR = "000000";
    };

    cursor = {
      size = 20;
      theme = "breeze_cursors";
    };
    # Laptop Display
    outputs = {
      "eDP-1" = {
        mode = {
          width = 3000;
          height = 1876;
          refresh = 120.001;
        };
        scale = 1.7166666666666666;
        backdrop-color = "#000000";
        background-color = "#000000";
      };
    };

    # Layout settings
    layout = {
      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };
      gaps = 5;
      focus-ring = {
        width = 1;
        active.color = "#7aa2f7";
      };
      center-focused-column = "never";
      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];
      default-column-width = {
        proportion = 0.5;
      };
    };

    # Decorations
    prefer-no-csd = true;

    gestures.hot-corners.enable = false;

    # Start Stuff
    spawn-at-startup = [
      { command = [ "noctalia-shell" ]; }
    ];

    # Laptop Lid
    switch-events = {
      lid-close.action.spawn = [ "noctalia-shell" "ipc" "call" "sessionMenu" "lockAndSuspend" ];
    };

    # Keybinds
    binds = {
      # Mod = super

      # Launch applications
      "Mod+Return".action.spawn = [ "alacritty" ];
      "Mod+D".action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
      "Mod+E".action.spawn = [ "nautilus" ];
      "Mod+W".action.spawn = [ "floorp" ];

      # Window management
      "Mod+Q".action.close-window = [ ];
      "Mod+O".action.toggle-overview = [ ];

      # Focus movement
      #"Mod+H".action.focus-column-left = [ ];
      "Mod+Left".action.focus-column-left = [ ];
      #"Mod+J".action.focus-window-down = [ ];
      "Mod+Down".action.focus-window-down = [ ];
      #"Mod+K".action.focus-window-up = [ ];
      "Mod+Up".action.focus-window-up = [ ];
      #"Mod+L".action.focus-column-right = [ ];
      "Mod+Right".action.focus-column-right = [ ];

      # Move windows
      #"Mod+Shift+H".action.move-column-left = [ ];
      "Mod+Shift+Left".action.move-column-left = [ ];
      #"Mod+Shift+J".action.move-window-down = [ ];
      "Mod+Shift+Down".action.move-window-down = [ ];
      #"Mod+Shift+K".action.move-window-up = [ ];
      "Mod+Shift+Up".action.move-window-up = [ ];
      #"Mod+Shift+L".action.move-column-right = [ ];
      "Mod+Shift+Right".action.move-column-right = [ ];

      # Focus monitor
      #"Mod+Ctrl+H".action.focus-monitor-left = [ ];
      "Mod+Ctrl+Left".action.focus-monitor-left = [ ];
      #"Mod+Ctrl+J".action.focus-monitor-down = [ ];
      "Mod+Ctrl+Down".action.focus-monitor-down = [ ];
      #"Mod+Ctrl+K".action.focus-monitor-up = [ ];
      "Mod+Ctrl+Up".action.focus-monitor-up = [ ];
      #"Mod+Ctrl+L".action.focus-monitor-right = [ ];
      "Mod+Ctrl+Right".action.focus-monitor-right = [ ];

      # Move window to monitor
      #"Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = [ ];
      "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [ ];
      #"Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = [ ];
      "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [ ];
      #"Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = [ ];
      "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [ ];
      #"Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = [ ];
      "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [ ];

      # Workspaces
      "Mod+Page_Down".action.focus-workspace-down = [ ];
      "Mod+Page_Up".action.focus-workspace-up = [ ];
      "Mod+U".action.focus-workspace-down = [ ];
      "Mod+I".action.focus-workspace-up = [ ];

      # Move to workspace
      "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [ ];
      "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = [ ];
      "Mod+Ctrl+U".action.move-column-to-workspace-down = [ ];
      "Mod+Ctrl+I".action.move-column-to-workspace-up = [ ];

      # Move window to workspace and switch
      "Mod+Shift+Page_Down".action.move-window-to-workspace-down = [ ];
      "Mod+Shift+Page_Up".action.move-window-to-workspace-up = [ ];
      "Mod+Shift+U".action.move-window-to-workspace-down = [ ];
      "Mod+Shift+I".action.move-window-to-workspace-up = [ ];

      # Focus workspace by index
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;

      # Move to workspace by index
      "Mod+Shift+1".action.move-column-to-workspace = 1;
      "Mod+Shift+2".action.move-column-to-workspace = 2;
      "Mod+Shift+3".action.move-column-to-workspace = 3;
      "Mod+Shift+4".action.move-column-to-workspace = 4;
      "Mod+Shift+5".action.move-column-to-workspace = 5;
      "Mod+Shift+6".action.move-column-to-workspace = 6;
      "Mod+Shift+7".action.move-column-to-workspace = 7;
      "Mod+Shift+8".action.move-column-to-workspace = 8;
      "Mod+Shift+9".action.move-column-to-workspace = 9;

      # Column width adjustments
      "Mod+R".action.switch-preset-column-width = [ ];
      "Mod+Shift+R".action.reset-window-height = [ ];
      "Mod+F".action.maximize-column = [ ];
      "Mod+Alt+F".action.maximize-window-to-edges = [ ];
      "Mod+Shift+F".action.fullscreen-window = [ ];
      "Mod+C".action.center-column = [ ];

      # Sizing with +/- and brackets
      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Equal".action.set-column-width = "+10%";
      "Mod+Shift+Minus".action.set-window-height = "-10%";
      "Mod+Shift+Equal".action.set-window-height = "+10%";

      # Comma and Period for workspace switching
      "Mod+Comma".action.consume-window-into-column = [ ];
      "Mod+Period".action.expel-window-from-column = [ ];

      # Screenshots
      "XF86SelectiveScreenshot".action.screenshot = [ ];
      "Ctrl+XF86SelectiveScreenshot".action.screenshot-screen = [ ];
      "Alt+XF86SelectiveScreenshot".action.screenshot-window = [ ];

      # System/Session
      "Mod+Shift+E".action.quit = [ ];
      "Mod+Shift+P".action.power-off-monitors = [ ];

      # Focus workspace previous/next
      "Mod+Tab".action.focus-workspace-previous = [ ];

      # Miscellaneous
      "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];

      # Brightness controls
      "XF86MonBrightnessUp".action.spawn = [ "brightnessctl" "set" "+5%" ];
      "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "set" "5%-" ];

      # Volume controls
      "XF86AudioRaiseVolume".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "increase" ];
      "XF86AudioLowerVolume".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "decrease" ];
      "XF86AudioMute".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "muteOutput" ];
      "XF86AudioMicMute".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "muteInput" ];

      # Useless laptop buttons given a use
      "Super+Shift+XF86TouchpadOff".action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
      "XF86Calculator".action.spawn = [ "gnome-calculator" ];

      # Nice to have binds
      "Mod+V".action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "clipboard" ];
      "Mod+L".action.spawn = [ "noctalia-shell" "ipc" "call" "lockScreen" "lock" ];
      "XF86Favorites".action.spawn = [ "code" "/etc/nixos" ];
      "Mod+Shift+Space".action.toggle-window-floating = [ ];
    };

    # Window rules
    window-rules = [
      {
        # Rounded corners to make it not look dumb on display that for some reason has rounded corners
        clip-to-geometry = true;
        geometry-corner-radius =
          let
            radius = 12.0;
          in
          {
            top-left = radius;
            top-right = radius;
            bottom-left = radius;
            bottom-right = radius;
          };
      }
      {
        matches = [
          { app-id = "^firefox$"; }
          { app-id = "^floorp$"; }
          { app-id = "^zen$"; }
          { app-id = "^chromium-browser$"; }
        ];
        open-maximized = true;
      }
      {
        matches = [
          {
            app-id = "^steam$";
            title = "^notificationtoasts_\\d+_desktop$";
          }
        ];
        default-floating-position = {
          x = 10;
          y = 10;
          relative-to = "bottom-right";
        };
      }
    ];

    layer-rules = [
      {
        matches = [ { namespace = "^noctalia-overview*"; } ];
        place-within-backdrop = true;
      }
    ];

    # Remove the thing at startup
    hotkey-overlay.skip-at-startup = true;
  };
}