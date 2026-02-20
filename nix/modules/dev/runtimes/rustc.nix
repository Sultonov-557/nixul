{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system =
    { pkgs, ... }:
    {
      environment.defaultPackages = with pkgs; [
        rustc
        cargo
        rustfmt
        pkg-config
        libxkbcommon
        alsa-lib
        libudev-zero
      ];
    };
}
