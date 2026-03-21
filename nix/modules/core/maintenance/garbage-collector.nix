{ lib, pkgs, ... }:
{
  home =
    { cfg, user, ... }:
    {
      systemd.user.services.home-profile-prune = lib.mkIf cfg.enable {
        Unit.Description = "Prune home-manager generations";
        Service.Type = "oneshot";
        Service.Environment = [ "NIX_REMOTE=daemon" ];
        Service.ExecStart = "${pkgs.nix}/bin/nix-env --profile /nix/var/nix/profiles/per-user/${user}/home-manager --delete-generations 14d";
      };

      systemd.user.timers.home-profile-prune = lib.mkIf cfg.enable {
        Unit.Description = "Schedule home-manager generation pruning";
        Timer.OnCalendar = "daily";
        Timer.Persistent = true;
        Install.WantedBy = [ "timers.target" ];
      };
    };}
