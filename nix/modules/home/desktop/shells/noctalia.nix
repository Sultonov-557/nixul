{ inputs, ... }: {
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = { systemd.enable = true; };
}
