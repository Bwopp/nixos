{ ... }:
{
  window-rules = [
    {
    clip-to-geometry = true;
    geometry-corner-radius =
      let
        radius = 0;
      in
      {
        top-left = radius;
        top-right = radius;
        bottom-left = radius;
        bottom-right = radius;
      };
    }
  ];
}