{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.lxqt.lxqt-policykit ];

      systemd.user.services.polkit-agent = {
        Description = "Polkit authentication agent";
        WantedBy = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
        Service = {
          ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
          Restart = "on-failure";
        };
      };
    };
}
