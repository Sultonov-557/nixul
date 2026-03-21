{ lib }:
{
  mkAliases = aliases:
    lib.listToAttrs (
      map (
        entry:
        let
          m = builtins.match "^([^=]+)=(.*)$" entry;
        in
        if m == null then
          {
            name = entry;
            value = "";
          }
        else
          {
            name = builtins.elemAt m 0;
            value = builtins.elemAt m 1;
          }
      ) aliases
    );
}
