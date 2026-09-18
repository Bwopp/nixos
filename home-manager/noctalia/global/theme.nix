{
  theme = {
    builtin = "Noctalia";
    community_palette = "Oxocarbon";
    custom_palette = "stylix";
    mode = "dark";
    pure_black_dark = false;
    source = "custom";
    wallpaper_scheme = "m3-content";
    templates = {
      builtin_ids = [ ];
      community_ids = [ ];
      enable_builtin_templates = false;
      enable_community_templates = false;
    };
  };

  wallpaper = {
    directory = "/home/bwop/Pictures/walls";
    directory_dark = "";
    directory_light = "";
    edge_smoothness = 0.30000001192092896;
    enabled = true;
    fill_color = "";
    fill_mode = "crop";
    per_monitor_directories = false;
    transition = [
      "fade"
      "wipe"
      "disc"
      "stripes"
      "zoom"
      "honeycomb"
    ];
    transition_duration = 1500.0;
    transition_on_startup = false;
    automation = {
      enabled = false;
      interval_seconds = 1800;
      order = "random";
      recursive = true;
    };
  };
}