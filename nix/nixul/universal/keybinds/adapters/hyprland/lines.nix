{
  lib,
  normalizeKeys,
  hyprCommands,
}:

keybind:
let
  combos = normalizeKeys keybind.keys;
  commands = hyprCommands keybind;

  mkOne =
    command: combo:
    let
      len = builtins.length combo;
    in
    if len == 0 then
      throw "Keybind keys combo cannot be empty"
    else
      let
        modsList = lib.sublist 0 (len - 1) combo;
        key = lib.elemAt combo (len - 1);
        mods = lib.concatStringsSep " " modsList;
      in
      "${mods},${key},${command}";
in
lib.concatMap (combo: map (command: mkOne command combo) commands) combos
