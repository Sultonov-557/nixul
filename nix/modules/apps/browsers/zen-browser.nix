{ inputs, config, ... }:
{

  home-manager.users.${config.nixul.user} = {
    imports = [ inputs.zen-browser.homeModules.default ];

    programs.zen-browser = {
      enable = true;

      extraPrefsFiles = [
        (builtins.fetchurl {
          url = "https://raw.githubusercontent.com/sineorg/bootloader/main/program/config.js";
          sha256 = "117a6gkaz1kinjflfzqc6qsb4r06x93w08q4lfdzh5a1cng95s5v";
        })
      ];
    };
  };
}
