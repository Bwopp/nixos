{ ... }:
{
  plugins = {
    enabled = [ 
      "radimous/prismlauncher-instances"
      "icefish/phone-connect"
      "lucasoe/proton-pass"
      "estvoid/sony_headphones"
      "samuelskovbakke/calculator-plus"
    ];
    auto_update = "all";
    source = [
      {
        enabled = true;
        kind = "git";
        location = "https://github.com/noctalia-dev/official-plugins";
        name = "official";
      }
      {
        enabled = true;
        kind = "git";
        location = "https://github.com/noctalia-dev/community-plugins";
        name = "community";
      }
    ];
  };
}