{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.lxqt.lxqt-policykit ];

  systemd.user.services.polkit-agent = {
    description = "Polkit authentication agent";

    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
      Restart = "on-failure";
    };
  };
}
