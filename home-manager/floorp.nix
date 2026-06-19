{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };
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
  ];
in
{
  programs.floorp = {
    enable = true;

    profiles.default = {
      isDefault = true;
      extensions.force = true;

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
      };
    };

    policies = {
      DisableTelemetry = true;
      ExtensionSettings = builtins.listToAttrs extensions;
    };
  };

  stylix.targets.floorp = {
    enable = true;
    profileNames = [ "default" ];
    firefoxGnomeTheme.enable = false;
    colorTheme.enable = true;
  };
}
