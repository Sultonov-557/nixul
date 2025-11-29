{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "sultonov";
    userEmail = "your.email@example.com";

    delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
        side-by-side = true;
      };
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "nvim";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };

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
}
