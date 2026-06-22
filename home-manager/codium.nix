{ pkgs, inputs, ... }:
let
  vscodeExts = inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        rust-lang.rust-analyzer
        # vscodeExts.open-vsx.auricvex.flake-env
        vscodeExts.open-vsx.datakurre.devenv
        jnoortheen.nix-ide
      ];
      userSettings = {
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        "python.defaultInterpreterPath" = "python";
        "python.locator" = "native";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
  };
}
