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
  ];
in
{
  home.packages = [
    (pkgs.wrapFirefox
      pkgs.floorp-unwrapped
      {
        extraPrefs = lib.concatLines (
          lib.mapAttrsToList (
            name: value: ''lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});''
          ) {
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
          }
        );
        extraPolicies = {
          DisableTelemetry = true;
          ExtensionSettings = builtins.listToAttrs extensions;
          SearchEngines = {
            Default = "ddg";
            Add = [
              {
                Name = "nixpkgs packages";
                URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@np";
              }
              {
                Name = "NixOS options";
                URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@no";
              }
              {
                Name = "NixOS Wiki";
                URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@nw";
              }
              {
                Name = "noogle";
                URLTemplate = "https://noogle.dev/q?term={searchTerms}";
                IconURL = "https://noogle.dev/favicon.ico";
                Alias = "@ng";
              }
            ];
          };
        };
      }
    )
  ];
}