{ config, lib, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;

  themeCss = ''
    .theme-dark {
      /* Backgrounds */
      --background-primary: ${colors.base00};
      --background-secondary: ${colors.base01};
      --background-secondary-alt: ${colors.base01};
      --background-modifier-border: ${colors.base02};
      --background-modifier-hover: ${colors.base02};
      --background-modifier-active-hover: ${colors.base03};

      /* Text */
      --text-normal: ${colors.base05};
      --text-faint: ${colors.base03};
      --text-muted: ${colors.base04};
      --text-accent: ${colors.base0D};
      --text-accent-hover: ${colors.base0C};
      --text-highlight-bg: ${colors.base02};
      --text-selection: ${colors.base02};

      /* Links */
      --text-link: ${colors.base0D};
      --text-link-hover: ${colors.base0C};

      /* Code */
      --code-background: ${colors.base01};
      --code-normal: ${colors.base05};
      --code-comment: ${colors.base03};
      --code-keyword: ${colors.base0E};
      --code-string: ${colors.base0B};
      --code-number: ${colors.base09};
      --code-function: ${colors.base0D};
      --code-operator: ${colors.base08};

      /* UI */
      --interactive-accent: ${colors.base0D};
      --interactive-accent-hover: ${colors.base0C};
      --interactive-success: ${colors.base0B};
      --interactive-warning: ${colors.base0A};
      --interactive-danger: ${colors.base08};
      --scrollbar-thumb-bg: ${colors.base02};
    }
  '';
in
{
  # Turn off default Stylix obsidian target
  stylix.targets.obsidian.enable = false;

  # Write theme files directly to the vault using Home Manager's file option
  home.file."Documents/Obsidian/Notes/.obsidian/themes/stylix/manifest.json".text = builtins.toJSON {
    name = "stylix";
    author = "Stylix";
    version = "1.0.0";
    minAppVersion = "0.13.0";
    authorUrl = "https://github.com/nix-community/stylix";
  };

  home.file."Documents/Obsidian/Notes/.obsidian/themes/stylix/theme.css".text = themeCss;

  programs.obsidian = {
    enable = true;
    vaults."Documents/Obsidian/Notes" = {
      enable = true;
      settings = {
        appearance.baseFontSize = lib.mkForce 16;
        appearance.cssTheme = "stylix";

        cssSnippets = [
          {
            name = "maths-scaling";
            text = ''
              mjx-frac {
                font-size: 1.3em !important;
                display: block !important;
              }
              .MathJax {
                font-size: 115%;
              }
            '';
          }
        ];
      };
    };
  };
}