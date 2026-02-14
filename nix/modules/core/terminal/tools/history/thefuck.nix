{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.pay-respects = {
      enable = true;
      options = [
        "--alias"
        "f"
      ];
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}
