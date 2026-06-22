{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings = {
      user = {
        name  = "bwop";
        email = "bwop@bwop.org";
      };
      init.defaultBranch = "main";
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}