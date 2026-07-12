{ pkgs, inputs, ... }:
{
  imports = [ inputs.noctalia-greeter.nixosModules.default ];
  programs.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

    greeter-args = "--user bwop";
    settings = {
      cursor = {
        theme = "breeze_cursors";
        size = 20;
        path = "${pkgs.kdePackages.breeze}/share/icons";
      };
    };
  };
}