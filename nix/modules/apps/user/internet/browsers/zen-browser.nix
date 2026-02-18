{
  inputs,
  config,
  pkgs,
  ...
}:
{
  ### IMPORTANT: this is workaround until github.com/0xc000022070/zen-browser-flake/issues/237 is fixed
  home-manager.users.${config.nixul.user} =
    { config, ... }:
    let
      cfg_orig = config.programs.zen-browser;
      zen-package =
        (inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight-unwrapped.override {
          policies = cfg_orig.policies;
        }).overrideAttrs
          (prev: {
            postInstall = prev.postInstall or "" + ''
              chmod -R u+w "$out/lib/zen-bin-${prev.version}"
              cp -r "${inputs.sine-bootloader}/program/"* "$out/lib/zen-bin-${prev.version}"
            '';
          });
    in
    {
      imports = [ inputs.zen-browser.homeModules.default ];

      programs.zen-browser = {
        enable = true;

        package = (pkgs.wrapFirefox zen-package { icon = "zen-twilight"; }).override {
          extraPrefs = cfg_orig.extraPrefs;
          extraPrefsFiles = cfg_orig.extraPrefsFiles;
          nativeMessagingHosts = cfg_orig.nativeMessagingHosts;
        };

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
