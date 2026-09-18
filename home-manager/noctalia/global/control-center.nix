{ ... }:
{
  control_center = {
    hidden_tabs = [ "screen-time" ];
    show_shortcut_labels = true;
    sidebar = "compact";
    sidebar_section = "compact";
    width = 700;
    calendar = {
      show_events_card = true;
      show_week_numbers = false;
    };
    shortcuts = [
      { type = "wifi"; }
      { type = "bluetooth"; }
      { type = "caffeine"; }
      { type = "nightlight"; }
      { type = "notification"; }
      { type = "power_profile"; }
    ];
  };
}