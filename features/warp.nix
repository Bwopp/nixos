{ config, lib, ... }:
{
  options.features.warp.enable = lib.mkEnableOption "warp";

  config = lib.mkIf config.features.warp.enable {
    services.cloudflare-warp = {
      enable = true;
      openFirewall = true;
    };
  };
}
