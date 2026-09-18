{ ... }:
{
  programs.niri.settings.binds = {
    # Mod = super

    # Launch applications
    "Mod+Return".action.spawn = [ "alacritty" ];
    "Mod+D".action.spawn = [ "noctalia" "msg" "panel-toggle" "launcher" ];
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
    "Mod+Shift+S".action.screenshot = [ ];
    "Mod+Shift+Ctrl+S".action.screenshot-screen = [ ];
    "Mod+Shift+Alt+S".action.screenshot-window = [ ];

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

    # Volume and audio controls
    "XF86AudioRaiseVolume".action.spawn = [ "noctalia" "msg" "volume-up" "5" ];
    "XF86AudioLowerVolume".action.spawn = [ "noctalia" "msg" "volume-down" "5" ];
    "XF86AudioMute".action.spawn = [ "noctalia" "msg" "volume-mute" ];
    "XF86AudioMicMute".action.spawn = [ "noctalia" "msg" "mic-mute" ];
    "XF86AudioPlay".action.spawn = [ "playerctl" "play-pause" ];
    "XF86AudioNext".action.spawn = [ "playerctl" "next" ];
    "XF86AudioPrev".action.spawn = [ "playerctl" "previous" ];

    # Useless laptop buttons given a use
    "XF86Calculator".action.spawn = [ "noctalia" "msg" "panel-toggle" "samuelskovbakke/calculator-plus:panel" ];

    # Nice to have binds
    "Mod+V".action.spawn = [ "noctalia" "msg" "panel-toggle" "clipboard" ];
    "Mod+Shift+C".action.spawn = [ "noctalia" "msg" "panel-toggle" "samuelskovbakke/calculator-plus:panel" ];
    "Mod+L".action.spawn = [ "noctalia" "msg" "session" "lock" ];
    "XF86Favorites".action.spawn = [ "codium" "/etc/nixos" ];
    "Mod+Shift+Space".action.toggle-window-floating = [ ];
  };
}