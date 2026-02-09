{ config, ... }:
{
  home-manager.users.${config.nixul.user} =
    { ... }:
    {
      programs.lutris.enable = true;
    };
}
