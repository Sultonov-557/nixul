{ config, ... }: {

  home-manager.users.${config.nixul.user} = { pkgs, ... }: {
    home.packages = with pkgs; [ imv ];

    programs.zathura = {
      enable = true;
      options = {
        selection-clipboard = "clipboard";
        adjust-open = "width";
        recolor = false;
      };
    };
  };
}
