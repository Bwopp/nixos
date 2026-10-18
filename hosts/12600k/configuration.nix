{ pkgs, ... }:
{

  features = {
    user-bwop.enable = true;

    alacritty.enable = true;
    bluetooth.enable = true;
    codium.enable = true;
    default-packages.enable = true;
    fish.enable = true;
    floorp.enable = false;
    gaming-packages.enable = true;
    git.enable = true;
    gnome-apps.enable = true;
    greeter.enable = true;
    keyring.enable = true;
    librewolf.enable = true;
    network.enable = true;
    nixcord.enable = true;
    obsidian.enable = true;
    pipewire.enable = true;
    sing-box.enable = true;
    spicetify.enable = true;
    steam.enable = true;
    warp.enable = false;

    stylix = {
      enable = true;
      cursorSize = 24;
    };

    umbriel = {
      enable = true;
      overrides = {
        input.cursor = {
          theme = "breeze_cursors";
          size = 24;
        };

        appearance.corner_radius = 0;

        output = {
          "LG Electronics 27GL850 010NTJJ8R044" = {
            mode = "2560x1440@144.0";
            scale = 1.0;
            position = [ 0 0 ];
            tearing = false;
            vrr = "disabled";
          };
          "Lenovo Group Limited T24i-10 VT685808" = {
            mode = "1920x1080@60.0";
            scale = 1.0;
            position = [ 2560 0 ];
            tearing = false;
          };
        };
      };
    };

    noctalia = {
      enable = true;
      overrides = {
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
            enabled = false;
            resume_command = "";
            timeout = 600.0;
          };
          behavior."lock-and-suspend" = {
            action = "lock_and_suspend";
            command = "";
            enabled = false;
            resume_command = "";
            timeout = 900.0;
          };
          behavior."screen-off" = {
            action = "screen_off";
            command = "";
            enabled = true;
            resume_command = "";
            timeout = 660.0;
          };
        };
        lockscreen_widgets = {
          enabled = true;
          schema_version = 2;
          widget_order = [
            "lockscreen-login-box@DP-1"
            "lockscreen-login-box@DP-2"
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

          widget."lockscreen-login-box@DP-1" = {
            box_height = 229.0;
            box_width = 810.0;
            cx = 1280.0;
            cy = 720.0;
            enabled = true;
            output = "DP-1";
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

          widget."lockscreen-login-box@DP-2" = {
            box_height = 229.0;
            box_width = 810.0;
            cx = 960.0;
            cy = 540.0;
            enabled = true;
            output = "DP-2";
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
            output = "DP-1";
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
            output = "DP-2";
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
            output = "DP-1";
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
            output = "DP-2";
            rotation = 0.0;
            type = "media_player";
            settings = { };
          };
        };
      };
    };
  };


  # da bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      maxGenerations = 30;
      resolution = "2560x1440";
      style = {
        interface.resolution = "2560x1440";
      };

    extraEntries = ''
      /Windows
        protocol: efi
        path: uuid(fdfecdc9-7a11-4268-8bbf-7c9b3b919399):/EFI/Microsoft/Boot/bootmgfw.efi
    '';
    };
  };
  
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.initrd.kernelModules = [ "amdgpu" ];
  
  networking.hostName = "12600k";

  time.timeZone = "Pacific/Auckland";

  i18n.defaultLocale = "en_NZ.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NZ.UTF-8";
    LC_IDENTIFICATION = "en_NZ.UTF-8";
    LC_MEASUREMENT = "en_NZ.UTF-8";
    LC_MONETARY = "en_NZ.UTF-8";
    LC_NAME = "en_NZ.UTF-8";
    LC_NUMERIC = "en_NZ.UTF-8";
    LC_PAPER = "en_NZ.UTF-8";
    LC_TELEPHONE = "en_NZ.UTF-8";
    LC_TIME = "en_NZ.UTF-8";
  };

  services.xserver.xkb = {
    layout = "nz";
    variant = "";
  };

  services.power-profiles-daemon.enable = true;

  services.btrfs.autoScrub.interval = "monthly";

  services.printing.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      libva
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  environment.variables = {
    LIBVA_DRIVER_NAME = "radeonsi";
  };

  hardware.amdgpu.opencl.enable = true;

  nixpkgs.config.rocmSupport = true;


  system.stateVersion = "25.11"; # Did you read the comment? no :|
}
