{ config, lib, ... }:
{
  options.features.librewolf.enable = lib.mkEnableOption "librewolf";

  config = lib.mkIf config.features.librewolf.enable {
    home-manager.sharedModules = [
      (
        { config, ... }:
        let
          c = config.lib.stylix.colors.withHashtag;

          extension = shortId: guid: {
            name = guid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "normal_installed";
              private_browsing = true;
            };
          };

          # To add additional extensions, find it on addons.mozilla.org, find
          # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
          # Then go to https://addons.mozilla.org/api/v5/addons/addon/!SHORT_ID!/ to get the guid

          extensions = [
            (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20@proton.me")
            (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
            (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
            (extension "istilldontcareaboutcookies" "idcac-pub@guus.ninja")
            (extension "return-youtube-dislikes" "{762f9885-5a13-4abd-9c77-433dcd38b8fd}")
            (extension "sponsorblock" "sponsorBlocker@ajay.app")
            (extension "don-t-fuck-with-paste" "DontFuckWithPaste@raim.ist")
            (extension "hide-youtube-shorts" "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}")
            (extension "always-visible" "{4b7825da-0dd1-44f9-9717-bee5b2408af6}")
          ];

          mkProfile = { id, accent, extra ? { } }: {
            inherit id;
            extensions.force = true;

            userChrome = ''
              /* ---------- variables ---------- */
              :root,
              :root:-moz-window-inactive {
                --toolbox-bgcolor: ${c.base00} !important;
                --toolbox-bgcolor-inactive: ${c.base00} !important;
                --toolbox-textcolor: ${c.base05} !important;
                --toolbox-textcolor-inactive: ${c.base04} !important;
                --toolbar-bgcolor: ${c.base00} !important;
                --toolbar-color: ${c.base05} !important;
                --toolbar-field-background-color: ${c.base01} !important;
                --toolbar-field-focus-background-color: ${c.base01} !important;
                --toolbar-field-color: ${c.base05} !important;
                --toolbar-field-focus-color: ${c.base05} !important;
                --toolbar-field-border-color: ${c.base02} !important;
                --toolbarbutton-hover-background: ${c.base02} !important;
                --toolbarbutton-active-background: ${c.base03} !important;
                --toolbarbutton-icon-fill: ${c.base05} !important;
                --tab-selected-bgcolor: ${c.base02} !important;
                --tab-selected-textcolor: ${c.base05} !important;
                --tab-loading-fill: ${accent} !important;
                --urlbar-box-bgcolor: ${c.base01} !important;
                --urlbar-box-hover-bgcolor: ${c.base02} !important;
                --urlbar-box-focus-bgcolor: ${c.base01} !important;
                --urlbar-box-text-color: ${c.base05} !important;
                --urlbarView-hover-background: ${c.base02} !important;
                --urlbarView-highlight-background: ${c.base02} !important;
                --urlbarView-highlight-color: ${c.base05} !important;
                --urlbarView-separator-color: ${c.base03} !important;
                --focus-outline-color: ${accent} !important;
                --lwt-accent-color: ${c.base00} !important;
                --lwt-text-color: ${c.base05} !important;
                --lwt-sidebar-background-color: ${c.base01} !important;
                --lwt-sidebar-text-color: ${c.base05} !important;
                --sidebar-background-color: ${c.base01} !important;
                --sidebar-text-color: ${c.base05} !important;
                --arrowpanel-background: ${c.base01} !important;
                --arrowpanel-color: ${c.base05} !important;
                --arrowpanel-border-color: ${c.base03} !important;
                --panel-background: ${c.base01} !important;
                --panel-color: ${c.base05} !important;
                --panel-border-color: ${c.base03} !important;
                --autocomplete-popup-background: ${c.base01} !important;
                --autocomplete-popup-color: ${c.base05} !important;
                --autocomplete-popup-highlight-background: ${c.base02} !important;
                --autocomplete-popup-highlight-color: ${c.base05} !important;
                --newtab-background-color: ${c.base00} !important;
                --tabpanel-background-color: ${c.base00} !important;
              }

              /* ---------- window / toolbars ---------- */
              #main-window,
              #navigator-toolbox,
              #titlebar,
              #TabsToolbar,
              #TabsToolbar-customization-target,
              #nav-bar,
              #toolbar-menubar,
              #PersonalToolbar,
              #tabbrowser-arrowscrollbox,
              #tabbrowser-tabs {
                background: ${c.base00} !important;
                background-color: ${c.base00} !important;
                background-image: none !important;
                color: ${c.base05} !important;
              }

              #navigator-toolbox { border-bottom: 1px solid ${c.base02} !important; }
              #nav-bar { box-shadow: none !important; border: none !important; }

              /* ---------- tabs ---------- */
              .tabbrowser-tab .tab-background {
                background: transparent !important;
                background-image: none !important;
              }
              .tabbrowser-tab:not([selected]):hover .tab-background {
                background: ${c.base01} !important;
              }
              .tabbrowser-tab .tab-label,
              .tabbrowser-tab .tab-close-button {
                color: ${c.base04} !important;
                fill: ${c.base04} !important;
              }
              .tabbrowser-tab[selected] .tab-label,
              .tabbrowser-tab[selected] .tab-close-button {
                color: ${c.base05} !important;
                fill: ${c.base05} !important;
              }

              #navigator-toolbox,
              #TabsToolbar,
              .tabbrowser-tab {
                --tab-selected-outline-color: ${accent} !important;
              }

              #tabbrowser-tabs .tabbrowser-tab > .tab-stack > .tab-background:is([selected], [multiselected]) {
                background: ${c.base02} !important;
                background-image: none !important;
                outline: 1px solid ${accent} !important;
                outline-offset: -1px !important;
                box-shadow: none !important;
              }

              /* ---------- buttons ---------- */
              toolbarbutton,
              .toolbarbutton-1 {
                color: ${c.base05} !important;
                fill: ${c.base05} !important;
              }
              toolbarbutton:not([disabled]):hover > .toolbarbutton-icon,
              toolbarbutton:not([disabled]):hover > .toolbarbutton-text,
              .toolbarbutton-1:not([disabled]):hover {
                background-color: ${c.base02} !important;
              }

              /* ---------- URL bar ---------- */
              /* Firefox redefines these on #urlbar itself, so set them there too */
              #urlbar,
              #urlbar-container,
              #searchbar {
                --toolbar-field-background-color: ${c.base01} !important;
                --toolbar-field-focus-background-color: ${c.base01} !important;
                --urlbar-box-bgcolor: ${c.base01} !important;
                --urlbar-box-hover-bgcolor: ${c.base01} !important;
                --urlbar-box-focus-bgcolor: ${c.base01} !important;
                --urlbarView-hover-background: ${c.base02} !important;
                --urlbarView-highlight-background: ${c.base02} !important;
                --urlbarView-highlight-color: ${c.base05} !important;
                --arrowpanel-background: ${c.base01} !important;
                --panel-background: ${c.base01} !important;
                --autocomplete-popup-background: ${c.base01} !important;
              }

              /* the one painted layer, in every state */
              :root #urlbar > #urlbar-background,
              :root #urlbar[focused] > #urlbar-background,
              :root #urlbar[open] > #urlbar-background,
              :root #urlbar[breakout-extend] > #urlbar-background,
              :root #searchbar {
                background: ${c.base01} !important;
                background-color: ${c.base01} !important;
                background-image: none !important;
                border: 1px solid ${c.base02} !important;
                box-shadow: none !important;
                outline: none !important;
              }

              :root #urlbar[focused] > #urlbar-background,
              :root #urlbar[breakout-extend] > #urlbar-background {
                border-color: ${accent} !important;
              }

              /* everything inside is transparent so it shows that one colour */
              :root #urlbar[breakout-extend],
              #urlbar-input-container,
              #urlbar-input,
              .urlbarView,
              .urlbarView-body-outer,
              .urlbarView-body-inner,
              .urlbarView-results,
              #urlbar-results,
              .urlbarView-row,
              .urlbarView-row-inner,
              .urlbarView-title,
              .urlbarView-url,
              .urlbarView-action,
              .urlbarView-no-wrap {
                background: transparent !important;
                background-color: transparent !important;
                background-image: none !important;
                border: none !important;
                box-shadow: none !important;
                color: ${c.base05} !important;
              }

              /* only the hovered / keyboard-selected row gets a highlight */
              .urlbarView-row:hover > .urlbarView-row-inner,
              .urlbarView-row[selected] > .urlbarView-row-inner {
                background-color: ${c.base02} !important;
              }

              #urlbar-input::selection {
                background-color: ${accent} !important;
                color: ${c.base00} !important;
              }
              
              /* ---------- popups, menus, panels ---------- */

              /* outer layers: transparent, so square backgrounds can't poke out of the rounded corners */
              panel,
              panelview,
              #appMenu-popup,
              #appMenu-mainView,
              .panel-subview-body,
              menupopup {
                background: transparent !important;
                background-color: transparent !important;
                appearance: none !important;
                -moz-appearance: none !important;
                box-shadow: none !important;
              }

              /* variables must be set on the popups themselves, not just :root */
              panel,
              menupopup,
              #contentAreaContextMenu {
                --panel-background: ${c.base01} !important;
                --panel-color: ${c.base05} !important;
                --panel-border-color: ${c.base03} !important;
                --arrowpanel-background: ${c.base01} !important;
                --arrowpanel-color: ${c.base05} !important;
                --arrowpanel-border-color: ${c.base03} !important;
                --menu-background-color: ${c.base01} !important;
                --menu-color: ${c.base05} !important;
                --panel-border-radius: 8px !important;
                --arrowpanel-border-radius: 8px !important;
                --menuitem-hover-background-color: ${c.base02} !important;
                --menuitem-hover-color: ${c.base05} !important;
              }

              /* the rounded layer that actually gets the colour */
              panel::part(content),
              .panel-arrowcontent,
              menupopup::part(content) {
                background: ${c.base01} !important;
                background-image: none !important;
                color: ${c.base05} !important;
                border: 1px solid ${c.base03} !important;
                border-radius: 8px !important;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4) !important;
                appearance: none !important;
                -moz-appearance: none !important;
              }

              menuitem,
              menu,
              .subviewbutton,
              .panel-subview-body label,
              .menu-text,
              .menu-iconic-text {
                color: ${c.base05} !important;
              }

              menuitem[disabled],
              menu[disabled],
              .subviewbutton[disabled] { color: ${c.base03} !important; }

              menuitem:not([disabled])[_moz-menuactive],
              menu:not([disabled])[_moz-menuactive],
              .subviewbutton:not([disabled]):hover {
                background-color: ${c.base02} !important;
                color: ${c.base05} !important;
              }

              menuseparator,
              .panel-subview-body menuseparator {
                border-color: ${c.base03} !important;
                background: transparent !important;
              }

              /* ---------- sidebar / findbar ---------- */
              #sidebar-box,
              #sidebar-header,
              #sidebar,
              findbar {
                background: ${c.base01} !important;
                color: ${c.base05} !important;
              }

              /* ---------- behind page content (no white flash while loading) ---------- */
              #tabbrowser-tabbox,
              #tabbrowser-tabpanels,
              .browserSidebarContainer,
              .browserContainer,
              browser[type="content-primary"],
              browser[type="content"] {
                background: ${c.base00} !important;
              }
            '';

            userContent = ''
              @-moz-document url-prefix(about:) {
                :root {
                  --in-content-page-background: ${c.base00} !important;
                  --in-content-page-color: ${c.base05} !important;
                  --in-content-box-background: ${c.base01} !important;
                  --in-content-box-background-hover: ${c.base02} !important;
                  --in-content-box-background-active: ${c.base02} !important;
                  --in-content-box-border-color: ${c.base02} !important;
                  --in-content-border-color: ${c.base02} !important;
                  --in-content-deemphasized-text: ${c.base04} !important;
                  --in-content-item-hover: ${c.base02} !important;
                  --in-content-item-hover-text: ${c.base05} !important;
                  --in-content-item-selected: ${accent} !important;
                  --in-content-item-selected-text: ${c.base00} !important;
                  --in-content-accent-color: ${accent} !important;
                  --in-content-primary-button-background: ${accent} !important;
                  --in-content-primary-button-text-color: ${c.base00} !important;
                  --in-content-focus-outline-color: ${accent} !important;
                  --newtab-background-color: ${c.base00} !important;

                  /* newer design-token names used by recent Firefox */
                  --background-color-canvas: ${c.base00} !important;
                  --background-color-box: ${c.base01} !important;
                  --text-color: ${c.base05} !important;
                  --border-color: ${c.base02} !important;
                  --color-accent-primary: ${accent} !important;
                }

                body {
                  background-color: ${c.base00} !important;
                  color: ${c.base05} !important;
                }
              }
            '';

            settings = {
              "extensions.autoDisableScopes" = 0;
              "extensions.pocket.enabled" = false;
              "widget.use-xdg-desktop-portal.file-picker" = 1;
              "widget.use-xdg-desktop-portal.location" = 1;
              "widget.use-xdg-desktop-portal.native-messaging" = 1;
              "widget.use-xdg-desktop-portal.open-uri" = 1;
              "widget.use-xdg-desktop-portal.settings" = 1;
              "signon.rememberSignons" = false;
              "signon.autofillForms" = false;
              "signon.generation.enabled" = false;
              "browser.ping-centre.telemetry" = false;
              "browser.newtabpage.activity-stream.showSponsored" = false;
              "extensions.formautofill.creditCards.enabled" = false;
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
              "userChrome.compatibility.theme" = false;
              "layout.css.prefers-color-scheme.content-override" = 0;
              "browser.theme.toolbar-theme" = 0;
              "browser.theme.content-theme" = 0;
              "browser.uidensity" = 1;
              "browser.toolbars.bookmarks.visibility" = "never";
              "browser.download.autohideButton" = true;
              "privacy.resistFingerprinting" = false;
              "browser.profiles.enabled" = false;
              "privacy.sanitize.sanitizeOnShutdown" = false;
              "browser.download.useDownloadDir" = true;
              "services.sync.engine.addons" = false;
              "network.http.referer.XOriginPolicy" = 2;
              "browser.theme.native-theme" = false;
              "widget.gtk.native-context-menus" = true;
              browser.tabs.inTitlebar = 0;
            };
          } // extra;
        in
        {
          programs.librewolf = {
            enable = true;

            profiles = {
              Personal = mkProfile {
                id = 0;
                accent = c.base0E;
                extra.isDefault = true;
              };

              School = mkProfile {
                id = 1;
                accent = c.base0D;
              };
            };

            policies = {
              DisableTelemetry = true;
              ExtensionSettings = builtins.listToAttrs extensions;
            };
          };

          stylix.targets.librewolf = {
            enable = true;
            profileNames = [ "Personal" "School" ];
            firefoxGnomeTheme.enable = false;
            colorTheme.enable = false;
          };

          xdg.desktopEntries = {
            librewolf = {
              name = "LibreWolf (Personal)";
              exec = "librewolf -P Personal %U";
              icon = "librewolf";
              terminal = false;
              categories = [ "Network" "WebBrowser" ];
              mimeType = [
                "text/html"
                "x-scheme-handler/http"
                "x-scheme-handler/https"
              ];
            };

            librewolf-school = {
              name = "LibreWolf (School)";
              exec = "librewolf -P School %U";
              icon = "librewolf";
              terminal = false;
              categories = [ "Network" "WebBrowser" ];
            };
          };
        }
      )
    ];
  };
}

