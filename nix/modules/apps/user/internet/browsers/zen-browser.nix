{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { inputs, ... }:
    {
      imports = [ inputs.zen-browser.homeModules.default ];

      programs.zen-browser = {
        enable = true;

        profiles.default = {
          id = 0;
          isDefault = true;
          name = "Default";

          sine = {
            enable = true;
            mods = [ "Nebula" ];
          };
        };
      };
    };
}
