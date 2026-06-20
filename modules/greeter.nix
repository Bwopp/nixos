{ config, pkgs, inputs, lib, ... }:
{
  imports = [ inputs.noctalia-greeter.nixosModules.default ];
  programs.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

    # Optional configuration
    greeter-args = "--user bwop";
    settings = {
      cursor = {
        theme = "breeze_cursors";
        size = 20;
        package = pkgs.kdePackages.breeze;
      };
    };
  };
}