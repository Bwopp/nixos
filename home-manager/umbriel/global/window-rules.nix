{
  window_rule = [
    {
      match.app_id = "^floorp$";
      default_maximize = true;
    }
    {
      match.app_id = "^steam$";
      match.title = "^notificationtoasts_.*_desktop$";
      default_position = {
        x = 10;
        y = 10;
        anchor = "bottom_right";
      };
    }
    {
      match.title = "^Maths Quiz";
      default_floating = true;
    }
  ];
}