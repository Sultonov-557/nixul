{ inputs, ... }: {
  imports = [ inputs.zen-browser.homeModules.default ];

  programs.zen-browser = {
    enable = true;
    profiles.default = {
      mods = [
        "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
      ];
    };
    extraPrefsFiles = [
      (builtins.fetchurl {
        url =
          "https://raw.githubusercontent.com/sineorg/bootloader/main/program/config.js";
        sha256 = "117a6gkaz1kinjflfzqc6qsb4r06x93w08q4lfdzh5a1cng95s5v";
      })
    ];
  };
}
