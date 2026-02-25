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
    ./alacritty.nix
    ./noctalia-shell.nix
    ./niri.nix
    ./vscode.nix
  ];
}
