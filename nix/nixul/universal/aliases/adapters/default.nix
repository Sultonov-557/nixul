{ lib }:

{
  mkAliases =
    aliases:
    let
      parse =
        s:
        let
          parts = lib.splitString "=" s;
          name = lib.head parts;
          cmd = lib.concatStringsSep "=" (lib.tail parts);
        in
        {
          inherit name;
          value = cmd;
        };
    in
    lib.listToAttrs (map parse aliases);
}
