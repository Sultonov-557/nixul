{ lib, bookmarkType }:

lib.types.submodule {
  options = {
    title = lib.mkOption {
      type = lib.types.str;
      description = "Group display title.";
    };

    items = lib.mkOption {
      type = lib.types.attrsOf bookmarkType;
      default = { };
      description = "Bookmarks in this group.";
    };
  };
}
