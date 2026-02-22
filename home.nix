{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "bwop";
  home.homeDirectory = "/home/bwop";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  imports = [
    inputs.niri.homeModules.niri
    inputs.noctalia.homeModules.default
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [
        "~/.config/alacritty/themes/noctalia.toml"
      ];
      window.padding = {
        x = 8;
        y = 8;
      };
    };
  };

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;

    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        timer = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        tailscale = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
      autoUpdate = true;
    };

    pluginSettings = {
      # Prolly somthing here later
    };

    settings = {
      settingsVersion = 0;

      # Noctalia settings
      bar = {
        barType = "simple";
        density = "compact";
        position = "top";
        monitors = [ ];
        showOutline = false;
        showCapsule = false;
        capsuleOpacity = 1;
        capsuleColorKey = "none";
        backgroundOpacity = 0.93;
        useSeparateOpacity = false;
        floating = false;
        marginVertical = 4;
        marginHorizontal = 4;
        frameThickness = 8;
        frameRadius = 12;
        outerCorners = true;
        hideOnOverview = false;
        displayMode = "always_visible";
        autoHideDelay = 500;
        autoShowDelay = 150;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
              colorizeDistroLogo = false;
              colorizeSystemIcon = "none";
              customIconPath = "";
              enableColorization = false;
              icon = "noctalia";
            }
            {
              displayMode = "onhover";
              iconColor = "none";
              id = "Network";
              textColor = "none";
            }
            {
              defaultSettings = {
                compactMode = false;
                defaultPeerAction = "copy-ip";
                hideDisconnected = false;
                pingCount = 5;
                refreshInterval = 5000;
                showIpAddress = true;
                showPeerCount = true;
                terminalCommand = "";
              };
              id = "plugin:tailscale";
            }
            {
              displayMode = "onhover";
              iconColor = "none";
              id = "Bluetooth";
              textColor = "none";
            }
            {
              displayMode = "onhover";
              iconColor = "none";
              id = "Volume";
              middleClickCommand = "pwvucontrol || pavucontrol";
              textColor = "none";
            }
            {
              compactMode = false;
              compactShowAlbumArt = true;
              compactShowVisualizer = false;
              hideMode = "hidden";
              hideWhenIdle = false;
              id = "MediaMini";
              maxWidth = 145;
              panelShowAlbumArt = true;
              panelShowVisualizer = true;
              scrollingMode = "hover";
              showAlbumArt = true;
              showArtistFirst = false;
              showProgressRing = true;
              showVisualizer = true;
              textColor = "none";
              useFixedWidth = false;
              visualizerType = "linear";
            }
          ];
          center = [
            {
              characterCount = 2;
              colorizeIcons = false;
              emptyColor = "secondary";
              enableScrollWheel = true;
              focusedColor = "primary";
              followFocusedScreen = false;
              groupedBorderOpacity = 1;
              hideUnoccupied = false;
              iconScale = 0.8;
              id = "Workspace";
              labelMode = "none";
              occupiedColor = "secondary";
              pillSize = 0.6;
              showApplications = false;
              showBadge = true;
              showLabelsOnlyWhenOccupied = true;
              unfocusedIconsOpacity = 1;
            }
          ];
          right = [
            {
              blacklist = [];
              chevronColor = "none";
              colorizeIcons = false;
              drawerEnabled = true;
              hidePassive = false;
              id = "Tray";
              pinned = [];
            }
            {
              deviceNativePath = "__default__";
              displayMode = "graphic-clean";
              hideIfIdle = false;
              hideIfNotDetected = true;
              id = "Battery";
              showNoctaliaPerformance = false;
              showPowerProfiles = true;
            }
            {
              hideWhenZero = false;
              hideWhenZeroUnread = false;
              iconColor = "none";
              id = "NotificationHistory";
              showUnreadBadge = true;
              unreadBadgeColor = "primary";
            }
            {
              defaultSettings = {
                compactMode = false;
                defaultDuration = 0;
                iconColor = "none";
                textColor = "none";
              };
              id = "plugin:timer";
            }
            {
              clockColor = "none";  
              customFont = "";
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              tooltipFormat = "HH:mm ddd, MMM dd";
              useCustomFont = false;
            }
          ];
        };
        screenOverrides = [ ];
      };

      general = {
        avatarImage = "/home/bwop/Pictures/cat.png";
        dimmerOpacity = 0.2;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 0.2;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
        lockScreenAnimations = false;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = false;
        enableShadows = false;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        language = "";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = true;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
        autoStartAuth = false;
        allowPasswordWithFprintd = false;
        clockStyle = "custom";
        clockFormat = "hh\nmm";
        lockScreenMonitors = [ ];
        lockScreenBlur = 0;
        lockScreenTint = 0;
        keybinds = {
          keyUp = [ "Up" ];
          keyDown = [ "Down" ];
          keyLeft = [ "Left" ];
          keyRight = [ "Right" ];
          keyEnter = [ "Return" ];
          keyEscape = [ "Esc" ];
          keyRemove = [ "Del" ];
        };
        reverseScroll = false;
      };

      ui = {
        fontDefault = "Liberation Mono";
        fontFixed = "Liberation Mono";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        tooltipsEnabled = true;
        panelBackgroundOpacity = 0.93;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        networkPanelView = "wifi";
        bluetoothHideUnnamedDevices = false;
        boxBorderEnabled = false;
      };

      location = {
        monthBeforeDay = false;
        name = "Auckland, New Zealand";
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = -1;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
      };

      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            id = "calendar-month-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
      };

      wallpaper = {
        enabled = true;
        overviewEnabled = true;
        directory = "/home/bwop/Pictures/walls";
        monitorDirectories = [ ];
        enableMultiMonitorDirectories = false;
        showHiddenFiles = false;
        viewMode = "single";
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        fillColor = "#000000";
        useSolidColor = false;
        solidColor = "#1a1a2e";
        automationEnabled = false;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        skipStartupTransition = false;
        transitionEdgeSmoothness = 0.05;
        panelPosition = "follow_bar";
        hideWallpaperFilenames = false;
        overviewBlur = 0.4;
        overviewTint = 0.6;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenRatios = "";
        wallhavenApiKey = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenResolutionHeight = "";
        sortOrder = "name";
        favorites = [ ];
      };

      appLauncher = {
        enableClipboardHistory = true;
        autoPasteClipboard = false;
        enableClipPreview = true;
        clipboardWrapText = true;
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        position = "center";
        pinnedApps = [ ];
        useApp2Unit = false;
        sortByMostUsed = true;
        terminalCommand = "alacritty -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "list";
        showCategories = true;
        iconMode = "tabler";
        showIconBackground = false;
        enableSettingsSearch = true;
        enableWindowsSearch = true;
        enableSessionSearch = true;
        ignoreMouseInput = false;
        screenshotAnnotationTool = "";
        overviewLayer = false;
        density = "default";
      };

      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "WallpaperSelector";
            }
            {
              id = "NoctaliaPerformance";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "PowerProfile";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "brightness-card";
          }
          {
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };

      systemMonitor = {
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        swapWarningThreshold = 80;
        swapCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        diskAvailWarningThreshold = 20;
        diskAvailCriticalThreshold = 10;
        batteryWarningThreshold = 20;
        batteryCriticalThreshold = 5;
        enableDgpuMonitoring = false;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
        externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
      };

      dock = {
        enabled = true;
        position = "left";
        displayMode = "auto_hide";
        dockType = "floating";
        backgroundOpacity = 1;
        floatingRatio = 1;
        size = 1;
        onlySameOutput = true;
        monitors = [ ];
        pinnedApps = [ ];
        colorizeIcons = false;
        pinnedStatic = false;
        inactiveIndicators = false;
        deadOpacity = 0.6;
        animationSpeed = 1;
        sitOnFrame = false;
        showFrameIndicator = true;
      };

      network = {
        wifiEnabled = true;
        airplaneModeEnabled = false;
        bluetoothRssiPollingEnabled = false;
        bluetoothRssiPollIntervalMs = 60000;
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
        disableDiscoverability = false;
      };

      sessionMenu = {
        enableCountdown = true;
        countdownDuration = 10000;
        position = "center";
        showHeader = true;
        showKeybinds = true;
        largeButtonsStyle = true;
        largeButtonsLayout = "single-row";
        powerOptions = [
          {
            action = "lock";
            enabled = true;
            keybind = "1";
          }
          {
            action = "suspend";
            enabled = true;
            keybind = "2";
          }
          {
            action = "hibernate";
            enabled = false;
            keybind = "3";
            # Dont work on dumb new laptop
          }
          {
            action = "reboot";
            enabled = true;
            keybind = "3";
          }
          {
            action = "logout";
            enabled = true;
            keybind = "4";
          }
          {
            action = "shutdown";
            enabled = true;
            keybind = "5";
          }
        ];
      };

      notifications = {
        enabled = true;
        enableMarkdown = false;
        density = "default";
        monitors = [ ];
        location = "top_right";
        overlayLayer = true;
        backgroundOpacity = 1;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        clearDismissed = true;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium,edge";
        };
        enableMediaToast = false;
        enableKeyboardLayoutToast = true;
        enableBatteryToast = true;
      };

      osd = {
        enabled = true;
        location = "top_right";
        autoHideMs = 2000;
        overlayLayer = true;
        backgroundOpacity = 1;
        enabledTypes = [
          0
          1
          2
        ];
        monitors = [ ];
      };

      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        cavaFrameRate = 30;
        visualizerType = "linear";
        mprisBlacklist = [ ];
        preferredPlayer = "";
        volumeFeedback = false;
      };

      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
      };

      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "Tokyo Night";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        generationMethod = "tonal-spot";
        monitorForColors = "";
      };

      templates = {
        activeTemplates = [ ];
        enableUserTheming = false;
      };

      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };

      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
        screenLock = "";
        screenUnlock = "";
        performanceModeEnabled = "";
        performanceModeDisabled = "";
        startup = "";
        session = "";
      };

      desktopWidgets = {
        enabled = false;
        gridSnap = false;
        monitorWidgets = [ ];
      };
    };
  };

  programs.niri.package = pkgs.niri;
  #inputs.niri.packages.${pkgs.system}.niri-unstable;
  programs.niri.settings = {
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
        scale = 1.74;
        backdrop-color = "#000000";
        background-color = "#000000";
      };
    };

    # Layout settings
    layout = {
      gaps = 5;
      focus-ring = {
        width = 3;
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
      # { command = [ "noctalia-shell" ]; }
    ];

    # Laptop Lid
    switch-events = {
      lid-close.action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "sessionMenu"
        "lockAndSuspend"
      ];
    };

    # Keybinds
    binds = {
      # Mod = super

      # Launch applications
      "Mod+Return".action.spawn = [ "alacritty" ];
      "Mod+D".action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];
      "Mod+E".action.spawn = [ "nautilus" ];
      "Mod+W".action.spawn = [ "floorp" ];

      # Window management
      "Mod+Q".action.close-window = [ ];
      "Mod+O".action.toggle-overview = [ ];

      # Focus movement
      "Mod+H".action.focus-column-left = [ ];
      "Mod+Left".action.focus-column-left = [ ];
      "Mod+J".action.focus-window-down = [ ];
      "Mod+Down".action.focus-window-down = [ ];
      "Mod+K".action.focus-window-up = [ ];
      "Mod+Up".action.focus-window-up = [ ];
      "Mod+L".action.focus-column-right = [ ];
      "Mod+Right".action.focus-column-right = [ ];

      # Move windows
      "Mod+Shift+H".action.move-column-left = [ ];
      "Mod+Shift+Left".action.move-column-left = [ ];
      "Mod+Shift+J".action.move-window-down = [ ];
      "Mod+Shift+Down".action.move-window-down = [ ];
      "Mod+Shift+K".action.move-window-up = [ ];
      "Mod+Shift+Up".action.move-window-up = [ ];
      "Mod+Shift+L".action.move-column-right = [ ];
      "Mod+Shift+Right".action.move-column-right = [ ];

      # Focus monitor
      "Mod+Ctrl+H".action.focus-monitor-left = [ ];
      "Mod+Ctrl+Left".action.focus-monitor-left = [ ];
      "Mod+Ctrl+J".action.focus-monitor-down = [ ];
      "Mod+Ctrl+Down".action.focus-monitor-down = [ ];
      "Mod+Ctrl+K".action.focus-monitor-up = [ ];
      "Mod+Ctrl+Up".action.focus-monitor-up = [ ];
      "Mod+Ctrl+L".action.focus-monitor-right = [ ];
      "Mod+Ctrl+Right".action.focus-monitor-right = [ ];

      # Move window to monitor
      "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = [ ];
      "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [ ];
      "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = [ ];
      "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [ ];
      "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = [ ];
      "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [ ];
      "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = [ ];
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
      "XF86AudioRaiseVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+" ];
      "XF86AudioLowerVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-" ];
      "XF86AudioMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
      "XF86AudioMicMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];

      # Useless laptop buttons given a use
      "Super+Shift+XF86TouchpadOff".action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
      "XF86Calculator".action.spawn = [ "gnome-calculator" ];

      # Nice to have binds
      "Mod+V".action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "clipboard" ];
      "Mod+Alt+L".action.spawn = [ "noctalia-shell" "ipc" "call" "lockScreen" "lock" ];
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
