{ config, pkgs, inputs, lib, hostName, ... }:

{
  programs.niri.package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  # inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  # pkgs.niri;
  programs.niri.settings = {

    # Window rules


    layer-rules = [
      {
        matches = [ { namespace = "^noctalia-overview*"; } ];
        place-within-backdrop = true;
      }
    ];

    # Remove the thing at startup
    
  };
}
