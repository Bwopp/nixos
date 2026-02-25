{
  config,
  pkgs,
  inputs,
  ...
}:
{
    programs.alacritty = {
        enable = true;
        settings = {
        general.import = [
            "~/.config/alacritty/themes/noctalia.toml"
        ];
        window.padding = {
            x = 8;
            y = 8;
        };
        };
    };
}