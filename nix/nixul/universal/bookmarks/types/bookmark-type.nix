{ lib }:

lib.types.submodule (
  { name, ... }:
  {
    options = {
      title = lib.mkOption {
        type = lib.types.str;
        description = "Display title of the bookmark.";
      };

      url = lib.mkOption {
        type = lib.types.str;
        description = "URL of the bookmark.";
      };

      icon = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "Optional icon name or URL.";
      };

      tags = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
        description = "Optional list of tags for categorization.";
      };

      order = lib.mkOption {
        type = lib.types.nullOr lib.types.int;
        default = null;
        description = "Optional ordering index.";
      };
    };
  }
)
