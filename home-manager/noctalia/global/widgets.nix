{ ... }:
{
  widget = {
    active_window = {
      icon_size = 14.0;
      max_length = 260.0;
      min_length = 80.0;
      title_scroll = "none";
      type = "active_window";
    };
    battery = {
      device = "/org/freedesktop/UPower/devices/battery_BAT1";
      display_mode = "graphic";
      show_label = true;
      type = "battery";
    };
    brightness = {
      show_label = false;
      type = "brightness";
    };
    control-center = {
      custom_image = "/home/bwop/Pictures/nix.png";
      custom_image_colorize = true;
      type = "control-center";
    };
    cpu = {
      stat = "cpu_usage";
      type = "sysmon";
    };
    custom_button_2 = {
      type = "custom_button";
    };
    date = {
      format = "{:%a %d %b}";
      type = "clock";
    };
    input_volume = {
      device = "input";
      type = "volume";
    };
    keyboard_layout = {
      hide_when_single_layout = false;
      type = "keyboard_layout";
    };
    lock_keys = {
      display = "short";
      hide_when_off = false;
      show_caps_lock = true;
      show_num_lock = true;
      show_scroll_lock = false;
      type = "lock_keys";
    };
    media = {
      art_size = 16.0;
      max_length = 600.0;
      hide_when_no_media = true;
      min_length = 80.0;
      title_scroll = "on_hover";
      type = "media";
    };
    network = {
      show_label = false;
      type = "network";
    };
    network_rx = {
      stat = "net_rx";
      type = "sysmon";
    };
    network_tx = {
      stat = "net_tx";
      type = "sysmon";
    };
    output_volume = {
      device = "output";
      type = "volume";
    };
    ram = {
      stat = "ram_used";
      type = "sysmon";
    };
    spacer = {
      interactive = false;
      type = "spacer";
    };
    temp = {
      stat = "cpu_temp";
      type = "sysmon";
    };
    tray = {
      hidden = [ "Zero Trust Client" ];
      type = "tray";
    };
    workspaces = {
      show_labels = false;
      label_source = "id";
      type = "workspaces";
    };
  };
}