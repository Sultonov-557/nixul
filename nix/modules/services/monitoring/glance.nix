{ lib, config, ... }:
let
  mkBookmarks = import ../../../nixul/universal/bookmarks/adapters/glance/default.nix {
    inherit lib;
  };
in
{
  system =
    { cfg, ... }:
    {
      services.glance = lib.mkIf cfg.enable {
        enable = true;
        settings.pages = [
          {
            name = "Home";
            hide-desktop-navigation = false;
            columns = [
              {
                size = "small";
                widgets = [
                  {
                    type = "clock";
                    hour-format = "24h";
                  }
                  {
                    type = "weather";
                    location = cfg.location or config.nixul.location or "The Moon";
                  }
                ];
              }
              {
                size = "full";
                widgets = [
                  {
                    type = "search";
                    search-engine = "google";
                  }
                  {
                    type = "group";
                    widgets = [
                      {
                        type = "bookmarks";
                        title = "Bookmarks";
                        groups = mkBookmarks config.nixul.host.bookmarks;
                      }
                    ];
                  }
                  {
                    type = "hacker-news";
                    limit = 15;
                    collapse-after = 5;
                  }
                ];
              }
            ];
          }
        ];
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable glance";
        };
        location = lib.mkOption {
          type = lib.types.str;
          default = null;
          description = "Location";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
