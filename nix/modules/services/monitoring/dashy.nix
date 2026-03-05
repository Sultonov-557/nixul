{ lib, pkgs, config, ... }:
let
  mkSections = import ../../../../nixul/universal/bookmarks/adapters/dashy/default.nix { inherit lib; };
in
{
  system =
    { cfg, ... }:
    let
      sections = mkSections config.nixul.host.bookmarks;
    in
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ dashy-ui ]);

      services.dashy = lib.mkIf cfg.enable {
        enable = true;

        settings = {
          pageInfo = {
            title = "Home";
            logo = "http://public.home/logo.png";
          };
          sections = sections;

          appConfig = {
            startingView = "minimal";
            theme = "glass";
            webSearch = {
              searchEngine = "google";
            };
            statusCheck = true;

            hideComponents = {
              hideFooter = true;
            };
            preventWriteToDisk = true;
            preventLocalSave = true;
            disableConfiguration = false;
            showSplashScreen = true;

            customCss = ''
              body {
               background:transparent !important;
              }'';
          };
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable dashy";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}

