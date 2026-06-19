{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  pipewireLdacWorkaround = pkgs.pipewire.overrideAttrs (old: {
    mesonFlags = (old.mesonFlags or [ ]) ++ [
      "-Dbluez5-codec-ldac-dec=disabled"
    ];
  });
in
{
  # Pipewire, audio and bluetooth codecs
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
    };
    extraConfig.pipewire = {
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
}