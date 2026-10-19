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
    nz-locale.enable = true;

    stylix = {
      enable = true;
      cursorSize = 20;
    };

    umbriel = {
      enable = true;
      overrides = {
        appearance.corner_radius = 12;
        output."EDO 0x4145 Unknown" = {
          mode = "3000x1876@120.001";
          scale = 1.7166666666666666;
          position = [ 0 0 ];
        };
        input.cursor = {
          theme = "breeze_cursors";
          size = 20;
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
            enabled = true;
            resume_command = "";
            timeout = 600.0;
          };
          behavior."lock-and-suspend" = {
            action = "lock_and_suspend";
            command = "";
            enabled = true;
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
            "lockscreen-login-box@eDP-1"
            "lockscreen-widget-0000000000000001"
            "lockscreen-widget-0000000000000002"
          ];
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };
          widget."lockscreen-login-box@eDP-1" = {
            box_height = 229.0;
            box_width = 810.0;
            cx = 874.0;
            cy = 546.5;
            enabled = true;
            output = "eDP-1";
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
          widget."lockscreen-widget-0000000000000001" = {
            box_height = 128.0;
            box_width = 208.0;
            cx = 874.0;
            cy = 290.5;
            enabled = true;
            output = "eDP-1";
            rotation = 0.0;
            type = "clock";
            settings = {
              background = false;
            };
          };
          widget."lockscreen-widget-0000000000000002" = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 874.0;
            cy = 808.5;
            enabled = true;
            output = "eDP-1";
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
      resolution = "3000x1876";
      style = {
        interface.resolution = "3000x1876";
        wallpapers = [ ];
        backdrop = "000000";
      };

      extraEntries = ''
        /Windows
          protocol: efi
          path: boot():///EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
  };

  # da kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.kernelModules = [
      "i915"
      "btrfs"
      "nvme"
      "sd-mod"
      "xhci_pci"
      "thunderbolt"
    ];
    kernelParams = [
      "pcie_aspm=force"
      "i915.force_probe=7d51"
      "xe.force_probe=!7d51"
    ];
    blacklistedKernelModules = [ "xe" ];
  };

  networking.hostName = "Yoga";

  # Time stuff
  time.timeZone = "Pacific/Auckland";

  services.power-profiles-daemon.enable = true;

  services.btrfs.autoScrub.interval = "monthly";

  services.upower.enable = true;

  # GPU stuff for drivers and hadware
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-media-driver
      mesa
      libva
      libva-utils
      intel-compute-runtime
      intel-gmmlib
      intel-npu-driver
    ];
  };

  # Fix intel wifi be200 not restoring after sleep
  systemd.services.disable-d3cold-wifi = {
    description = "Disable D3cold for Wifi";
    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''/bin/sh -c "echo 0 > /sys/bus/pci/devices/0000:01:00.0/d3cold_allowed"'';
    };
  };

  networking.firewall.allowedTCPPorts = [
    7236
    7250
    7777
    25565
  ];
  networking.firewall.allowedUDPPorts = [
    7236
    5353
    7777
    25565
  ];

  system.stateVersion = "25.11"; # Did you read the comment? no lol
}
