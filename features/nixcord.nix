{ config, lib, inputs, ... }:
{
  options.features.nixcord.enable = lib.mkEnableOption "nixcord";

  config = lib.mkIf config.features.nixcord.enable {
    home-manager.sharedModules = [
      inputs.nixcord.homeModules.nixcord
      {
        programs.nixcord = {
          enable = true;
          discord = {
            enable = true;
            krisp.enable = true;
            vencord.enable = false;
            equicord.enable = true;
          };
          legcord.enable = false;
          config = {
            plugins = {
              betterSearch.enable = true;
              blurNsfw.enable = true;
              callTimer.enable = true;
              clearUrls.enable = true;
              consoleJanitor.enable = true;
              customTimestamps = {
                formats.enable = false;
              };
              declutter = {
                enable = true;
                removeAvatarDecoration = true;
                removeQuestsAboveDms = true;
                removeShopAboveDms = true;
                removeAudioMenus = false;
              };
              equicordToolbox.enable = true;
              fakeNitro.enable = true;
              fixImagesQuality.enable = true;
              fixSpotifyEmbeds.enable = true;
              fixYoutubeEmbeds.enable = true;
              forceOwnerCrown.enable = true;
              gameActivityToggle.enable = true;
              imageZoom.enable = true;
              memberCount.enable = true;
              messageLogger.enable = true;
              moreUserTags = {
                tagSettings = {
                  administrator.enable = false;
                  chatModerator.enable = false;
                  moderator.enable = false;
                  moderatorStaff.enable = false;
                  owner.enable = false;
                  voiceModerator.enable = false;
                  webhook.enable = false;
                  enable = false;
                };
              };
              mutualGroupDms.enable = true;
              noF1.enable = true;
              noNitroUpsell.enable = true;
              noProfileThemes.enable = true;
              petpet.enable = true;
              searchFix.enable = true;
              showHiddenChannels.enable = true;
              splitLargeMessages.enable = true;
              translate.enable = true;
              whosWatching.enable = true;
              youtubeAdblock.enable = true;
            };
          };
          extraConfig.plugins = {
            musicRichPresence = {
              showLastFmLogo = true;
            };
            shikiCodeblocks = {
              tryHljs = "SECONDARY";
            };
          };
        };

        stylix.targets.nixcord.extraCss = ''
          .theme-light,
          .theme-dark,
          .theme-darker,
          .theme-midnight,
          .visual-refresh {
              --blurple-50: var(--base0D) !important;
              --button-outline-positive-border: var(--base0D) !important;
              --button-positive-background: var(--base0D) !important;
              --checkbox-background-checked: var(--base0D) !important;
              --checkbox-border-checked: var(--base0D) !important;
              --green-330: var(--base0D) !important;
              --green-360: var(--base0D) !important;
              --notice-background-positive: var(--base0D) !important;
              --status-positive-background: var(--base0D) !important;
              --status-positive-text: var(--base0D) !important;
              --status-positive: var(--base0D) !important;
              --status-success: var(--base0D) !important;
              --text-feedback-positive: var(--base0D) !important;
              --text-feedback-success: var(--base0D) !important;
              --text-positive: var(--base0D) !important;
          }

          .checked__87bf1 {
              background-color: var(--base0D) !important;
          }
          .barText__7aaec {
              color: var(--base0D) !important;
          }
          .unreadIcon__7aaec {
              color: var(--base0D) !important;
          }
          .hljs-selector-pseudo {
              color: var(--base0D) !important;
          }
          .hljs-section {
              color: var(--base0D) !important;
          }
          .hljs-string {
              color: var(--base0D) !important;
          }
        '';
      }
    ];
  };
}