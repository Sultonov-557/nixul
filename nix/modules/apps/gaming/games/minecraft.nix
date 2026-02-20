{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system =
    { config, ... }:
    {
      home-manager.users.${config.nixul.primaryUser} =
        { inputs, pkgs, ... }:
        {
          imports = [ inputs.xmcl.homeModules.xmcl ];

          programs.xmcl = {
            enable = true;
            commandLineArgs = [ ''--password-store="gnome-libsecret"'' ];
            jres = [
              pkgs.jre8
              pkgs.temurin-jre-bin-17
              pkgs.temurin-jre-bin-21
            ];
          };
        };
    };
}
