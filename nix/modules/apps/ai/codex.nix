{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.codex = {
      enable = true;
      custom-instructions = ''
        write understandable code without comments
        make your code modular and easy to understand and reuse
        if you are unsure about something ask the user'';
    };
  };
}
