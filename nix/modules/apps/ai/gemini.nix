{ config, ... }: {

  home-manager.users.${config.nixul.user} = { pkgs, ... }: {
    home.packages = with pkgs; [ gemini-cli ];
  };
}
