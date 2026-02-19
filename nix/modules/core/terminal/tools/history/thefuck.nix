{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
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
