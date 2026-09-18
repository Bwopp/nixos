{ ... }:
{
  programs.niri.settings.layer-rules = [
    {
      matches = [ { namespace = "^noctalia-overview*"; } ];
      place-within-backdrop = true;
    }
  ];
}