{ lib }:

bookmarks:
let
  sortedItems = group:
    lib.sort (a: b:
      let
        orderA = if a.order != null then a.order else 999;
        orderB = if b.order != null then b.order else 999;
      in
      orderA < orderB
    ) (lib.attrValues group.items);

  mkSection = name: group: {
    name = group.title;
    icon = "si-bookmark";
    items = map (item: {
      title = item.title;
      url = item.url;
      icon = if item.icon != null then item.icon else "si-bookmark";
      statusCheck = false;
    }) (sortedItems group);
  };
in
lib.mapAttrsToList mkSection bookmarks
