{
  plugins = {
    enabled = [ 
      "radimous/prismlauncher-instances"
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
  plugin_settings."samuelskovbakke/calculator-plus" = {
    panel_placement = "floating";
    panel_position = "center";
  };
}