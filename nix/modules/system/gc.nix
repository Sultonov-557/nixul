{ config, pkgs, ... }:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 14d --keep 10";
    flake = "${../../..}";
  };

  boot.loader.grub.configurationLimit = 15;

  home-manager.users.${config.nixul.user} = {
    systemd.user.services.home-profile-prune = {
      Unit.Description = "Prune home-manager generations";
      Service.Type = "oneshot";
      Service.Environment = [ "NIX_REMOTE=daemon" ];
      Service.ExecStart = "${pkgs.nix}/bin/nix-env --profile /nix/var/nix/profiles/per-user/${config.nixul.user}/home-manager --delete-generations 14d";
    };

    systemd.user.timers.home-profile-prune = {
      Unit.Description = "Schedule home-manager generation pruning";
      Timer.OnCalendar = "daily";
      Timer.Persistent = true;
      Install.WantedBy = [ "timers.target" ];
    };
  };
}
