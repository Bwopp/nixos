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

  mkProfile = { id, accent, extra ? { } }:
    let
      theme = import ./theme.nix { inherit c accent; };
    in
    {
      inherit id;
      extensions.force = true;

      inherit (theme) userChrome userContent;

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
        "browser.tabs.inTitlebar" = 0;
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