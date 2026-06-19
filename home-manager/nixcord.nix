{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    legcord = {
      enable = true;
      equicord.enable = true;
      settings = {
        channel = "stable";
        tray = "dynamic";
        minimizeToTray = true;
        mods = [ "equicord" ];
        doneSetup = true;
      };
    };
  };

  stylix.targets.nixcord.extraCss = ''
    .theme-light,
    .theme-dark,
    .theme-darker,
    .theme-midnight,
    .visual-refresh {
        --blurple-50: var(--base0A) !important;
        --button-outline-positive-border: var(--base0A) !important;
        --button-positive-background: var(--base0A) !important;
        --checkbox-background-checked: var(--base0A) !important;
        --checkbox-border-checked: var(--base0A) !important;
        --green-330: var(--base0A) !important;
        --green-360: var(--base0A) !important;
        --notice-background-positive: var(--base0A) !important;
        --status-positive-background: var(--base0A) !important;
        --status-positive-text: var(--base0A) !important;
        --status-positive: var(--base0A) !important;
        --status-success: var(--base0A) !important;
        --text-feedback-positive: var(--base0A) !important;
        --text-feedback-success: var(--base0A) !important;
        --text-positive: var(--base0A) !important;
    }

    .checked__87bf1 {
        background-color: var(--base0A) !important;
    }
    .barText__7aaec {
        color: var(--base0A) !important;
    }
    .unreadIcon__7aaec {
        color: var(--base0A) !important;
    }
    .hljs-selector-pseudo {
        color: var(--base0A) !important;
    }
    .hljs-section {
        color: var(--base0A) !important;
    }
    .hljs-string {
        color: var(--base0A) !important;
    }
  '';

  xdg.configFile."legcord/themes/Stylix-BD/manifest.json".text = builtins.toJSON {
    theme = "src.css";
    name = "Stylix";
    enabled = true;
    author = "Stylix";
    version = "0.0.0";
    description = "Stylix theme thing for legcord via nixcord";
    supportsLegcordTitlebar = false;
  };

  xdg.configFile."legcord/themes/Stylix-BD/src.css".text =
    config.stylix.targets.nixcord.themeBody + config.stylix.targets.nixcord.extraCss;
}
