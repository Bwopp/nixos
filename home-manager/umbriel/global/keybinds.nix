{
  keybinds = {
    # Launch applications
    "Mod+Return" = "spawn:alacritty";
    "Mod+D" = "spawn:noctalia msg panel-toggle launcher";
    "Mod+E" = "spawn:nautilus";
    "Mod+W" = "spawn:floorp";

    # Window & overview management
    "Mod+Q" = "window-close";
    "Mod+O" = "overview-toggle";
    "Mod+Shift+Space" = "window-toggle-floating";

    # Focus movement
    "Mod+Left" = "window-focus-left";
    "Mod+Down" = "window-focus-down";
    "Mod+Up" = "window-focus-up";
    "Mod+Right" = "window-focus-right";

    # Move windows / columns
    "Mod+Shift+Left" = "column-move-left";
    "Mod+Shift+Down" = "window-move-down";
    "Mod+Shift+Up" = "window-move-up";
    "Mod+Shift+Right" = "column-move-right";

    # Focus monitor (output)
    "Mod+Ctrl+Left" = "output-focus-left";
    "Mod+Ctrl+Down" = "output-focus-down";
    "Mod+Ctrl+Up" = "output-focus-up";
    "Mod+Ctrl+Right" = "output-focus-right";

    # Move column to monitor (output)
    "Mod+Shift+Ctrl+Left" = "column-move-to-output-left";
    "Mod+Shift+Ctrl+Down" = "column-move-to-output-down";
    "Mod+Shift+Ctrl+Up" = "column-move-to-output-up";
    "Mod+Shift+Ctrl+Right" = "column-move-to-output-right";

    # Workspaces
    "Mod+Page_Down" = "workspace-next";
    "Mod+Page_Up" = "workspace-previous";
    "Mod+U" = "workspace-next";
    "Mod+I" = "workspace-previous";

    # Move to workspace
    "Mod+Ctrl+Page_Down" = "column-move-to-workspace-next";
    "Mod+Ctrl+Page_Up" = "column-move-to-workspace-previous";
    "Mod+Ctrl+U" = "column-move-to-workspace-next";
    "Mod+Ctrl+I" = "column-move-to-workspace-previous";

    # Move window to workspace
    "Mod+Shift+Page_Down" = "window-move-to-workspace-next";
    "Mod+Shift+Page_Up" = "window-move-to-workspace-previous";
    "Mod+Shift+U" = "window-move-to-workspace-next";
    "Mod+Shift+I" = "window-move-to-workspace-previous";

    # Workspace by index
    "Mod+1" = "workspace-switch:1";
    "Mod+2" = "workspace-switch:2";
    "Mod+3" = "workspace-switch:3";
    "Mod+4" = "workspace-switch:4";
    "Mod+5" = "workspace-switch:5";
    "Mod+6" = "workspace-switch:6";
    "Mod+7" = "workspace-switch:7";
    "Mod+8" = "workspace-switch:8";
    "Mod+9" = "workspace-switch:9";

    # Move to workspace by index
    "Mod+Shift+1" = "column-move-to-workspace:1";
    "Mod+Shift+2" = "column-move-to-workspace:2";
    "Mod+Shift+3" = "column-move-to-workspace:3";
    "Mod+Shift+4" = "column-move-to-workspace:4";
    "Mod+Shift+5" = "column-move-to-workspace:5";
    "Mod+Shift+6" = "column-move-to-workspace:6";
    "Mod+Shift+7" = "column-move-to-workspace:7";
    "Mod+Shift+8" = "column-move-to-workspace:8";
    "Mod+Shift+9" = "column-move-to-workspace:9";

    # Column / window sizing & adjustments
    "Mod+R" = "window-cycle-primary-extent";
    "Mod+Shift+R" = "window-cycle-primary-extent-back";
    "Mod+F" = "window-toggle-maximize";
    "Mod+Alt+F" = "window-toggle-maximize-to-edges";
    "Mod+Shift+F" = "window-toggle-fullscreen";
    "Mod+C" = "column-center";

    # Dimension adjustments (+/-)
    "Mod+Minus" = "window-modify-primary-extent:-0.1";
    "Mod+Equal" = "window-modify-primary-extent:0.1";
    "Mod+Shift+Minus" = "window-modify-secondary-extent:-0.1";
    "Mod+Shift+Equal" = "window-modify-secondary-extent:0.1";

    # Consume / Expel
    "Mod+Comma" = "window-consume-or-expel-left";
    "Mod+Period" = "window-consume-or-expel-right";

    # Screenshots
    "XF86SelectiveScreenshot" = "spawn:noctalia msg screenshot-region";
    "Ctrl+XF86SelectiveScreenshot" = "spawn:noctalia msg screenshot-fullscreen";
    "Alt+XF86SelectiveScreenshot" = "spawn:noctalia msg screenshot-annotate";
    "Mod+Shift+S" = "spawn:noctalia msg screenshot-region";
    "Mod+Shift+Ctrl+S" = "spawn:noctalia msg screenshot-fullscreen";
    "Mod+Shift+Alt+S" = "spawn:noctalia msg screenshot-annotate";

    # System & Session
    "Mod+Shift+E" = "session-quit";
    "Mod+Shift+P" = "dpms-off";
    "Mod+Tab" = "workspace-focus-last";
    "Mod+Shift+Slash" = "cheatsheet-toggle";

    # Hardware Controls
    "XF86MonBrightnessUp" = "spawn:brightnessctl set +5%";
    "XF86MonBrightnessDown" = "spawn:brightnessctl set 5%-";
    "XF86AudioRaiseVolume" = "spawn:noctalia msg volume-up 5";
    "XF86AudioLowerVolume" = "spawn:noctalia msg volume-down 5";
    "XF86AudioMute" = "spawn:noctalia msg volume-mute";
    "XF86AudioMicMute" = "spawn:noctalia msg mic-mute";
    "XF86AudioPlay" = "spawn:playerctl play-pause";
    "XF86AudioNext" = "spawn:playerctl next";
    "XF86AudioPrev" = "spawn:playerctl previous";

    # Extra Binds
    "XF86Calculator" = "spawn:gnome-calculator";
    "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
    "Mod+L" = "spawn:noctalia msg session lock";
    "XF86Favorites" = "spawn:codium /etc/nixos";
  };
}