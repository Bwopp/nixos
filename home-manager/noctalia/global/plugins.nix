{
  plugins = {
    enabled = [ 
      "radimous/prismlauncher-instances"
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