{ lib, config, ... }:
{
  home =
    { cfg, user, nixul, ... }:
    {
      programs.git = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          user = {
            name = nixul.users.${user}.name;
            email = nixul.users.${user}.email;
          };

          delta = {
            enable = true;          };

          init.defaultBranch = "main";
          push.autoSetupRemote = true;
          pull.rebase = false;
          core.editor = "nvim";
          merge.conflictstyle = "diff3";
          diff.colorMoved = "default";

          aliases = {
            st = "status";
            co = "checkout";
            br = "branch";
            ci = "commit";
            unstage = "reset HEAD --";
            last = "log -1 HEAD";
            lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
          };
        };
      };
    };}
