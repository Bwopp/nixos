{ config, lib, ... }:
{
  options.features.codium.enable = lib.mkEnableOption "codium";

  config = lib.mkIf config.features.codium.enable {
    home-manager.sharedModules = [
      (
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
                # rust-lang.rust-analyzer
                # vscodeExts.open-vsx.auricvex.flake-env
                # vscodeExts.open-vsx.datakurre.devenv
                jnoortheen.nix-ide
                golang.go
              ];
              userSettings = {
                "git.confirmSync" = false;
                "git.enableSmartCommit" = true;
                "nix.enableLanguageServer" = true;
                "nix.serverPath" = "nixd";
                "chat.editor.fontFamily" = "DejaVu Sans Mono";
                "chat.editor.fontSize"= 16.0;
                "chat.fontFamily"= "DejaVu Sans";
                "debug.console.fontFamily"= "DejaVu Sans Mono";
                "debug.console.fontSize"= 16.0;
                "editor.fontFamily"= "DejaVu Sans Mono";
                "editor.fontSize"= 16.0;
                "editor.inlayHints.fontFamily"= "DejaVu Sans Mono";
                "editor.inlineSuggest.fontFamily"= "DejaVu Sans Mono";
                "markdown.preview.fontFamily"= "DejaVu Sans";
                "markdown.preview.fontSize"= 16.0;
                "notebook.markup.fontFamily"= "DejaVu Sans";
                "python.defaultInterpreterPath"= "python";
                "python.locator"= "native";
                "scm.inputFontFamily"= "DejaVu Sans Mono";
                "screencastMode.fontSize"= 64.0;
                "terminal.integrated.fontSize"= 16.0;
              };
            };
          };
        }
      )
    ];
  };
}


