{ ... }:
{
  window-rules = [
    {
      matches = [
        { app-id = "^floorp$"; }
      ];
      open-maximized = true;
    }
    {
      matches = [
        {
          app-id = "^steam$";
          title = "^notificationtoasts_\\d+_desktop$";
        }
      ];
      default-floating-position = {
        x = 10;
        y = 10;
        relative-to = "bottom-right";
      };
    }
  ];
}