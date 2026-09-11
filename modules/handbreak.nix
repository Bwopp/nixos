{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: {
    handbrake = pkgs.handbrake.overrideAttrs (old: {
      configureFlags = old.configureFlags ++ [ "--enable-vce" ];
      buildInputs = old.buildInputs ++ [
        pkgs.amf
        pkgs.amf-headers
        pkgs.libva
      ];
      NIX_CFLAGS_COMPILE = "-I${pkgs.amf-headers}/include";
      env = (old.env or {}) // {
        NIX_LDFLAGS = (old.env.NIX_LDFLAGS or "") + " -L${pkgs.amf}/lib";
      };
      nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];
      postFixup = (old.postFixup or "") + ''
        for bin in $out/bin/HandBrakeCLI $out/bin/ghb; do
          [ -f "$bin" ] && wrapProgram "$bin" --prefix LD_LIBRARY_PATH : ${pkgs.amf}/lib
        done
      '';
    });
  };

  environment.systemPackages = with pkgs; [
    handbrake
    libva-utils
  ];
}