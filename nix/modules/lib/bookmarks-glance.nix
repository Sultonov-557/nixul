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

  mkGroup = _name: group: {
    title = group.title;
    links = map (item: {
      title = item.title;
      url = item.url;
    }) (sortedItems group);
  };
in
lib.mapAttrsToList mkGroup bookmarks
