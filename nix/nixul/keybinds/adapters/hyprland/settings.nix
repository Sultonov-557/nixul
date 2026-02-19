{
  lib,
  mkLines,
  bindGroup,
}:

lib.foldl' (
  acc: keybind:
  let
    group = bindGroup keybind;
    lines = mkLines keybind;
    prev = acc.${group} or [ ];
  in
  acc // { ${group} = prev ++ lines; }
) { }
