{ pkgs, config, ... }: {

  home-manager.users.${config.nixul.user} = {
    programs.gh = {
      enable = true;
      gitCredentialHelper = { enable = true; };
    };
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Sultonov-557";
          email = "sultonovzerifboy@gmail.com";
        };

        delta = {
          enable = true;
          options = {
            navigate = true;
            line-numbers = true;
            side-by-side = true;
          };
        };

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
          lg =
            "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        };
      };
    };

    home.packages = with pkgs; [ lazygit gh ];
  };
}
