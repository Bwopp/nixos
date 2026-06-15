{ config, pkgs, lib, inputs, ... }:
{
  programs.obsidian = {
    enable = true;
    vaults."Documents/Obsidian/Notes".enable = true;

    defaultSettings = {
      appearance = {
        baseFontSize = lib.mkForce 16;
      };

      cssSnippets = [
        {
          name = "math-scaling";
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

  stylix.targets.obsidian = {
    enable = true;
    vaultNames = [ "Notes" ];
  };
}