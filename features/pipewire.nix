{ config, lib, pkgs, ... }:
let
  pipewireLdacWorkaround = pkgs.pipewire.overrideAttrs (old: {
    mesonFlags = (old.mesonFlags or [ ]) ++ [
      "-Dbluez5-codec-ldac-dec=disabled"
    ];
  });
in
{
  options.features.pipewire.enable = lib.mkEnableOption "pipewire";

  config = lib.mkIf config.features.pipewire.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      package = pipewireLdacWorkaround;
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;

      wireplumber = {
        enable = true;
        package = pkgs.wireplumber.override {
          pipewire = pipewireLdacWorkaround;
        };

        # Ask for 32-bit output on the USB DAC
        extraConfig."51-dac-format" = {
          "monitor.alsa.rules" = [
            {
              matches = [ { "node.name" = "~alsa_output.usb-*"; } ];
              actions.update-props = {
                "audio.format" = "S32LE";
              };
            }
          ];
        };
      };

      extraConfig.pipewire = {
        # Let the graph switch rates to match the track, up to 384kHz
        "92-allowed-rates" = {
          "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.allowed-rates" = [
              44100 48000 88200 96000 176400 192000 352800 384000
            ];
          };
        };

        "context.modules" = [
          {
            name = "libpipewire-module-bluez5";
            args = {
              "bluez5.codecs" = [
                "sbc"
                "aac"
                "aptx"
                "aptx_hd"
                "ldac"
              ];
            };
          }
        ];
      };
    };
  };
}