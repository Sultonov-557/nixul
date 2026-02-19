{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 14d --keep 10";
      flake = "${../../..}";
    };
  };
}
