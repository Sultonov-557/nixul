{ lib }:

let
  table = {
    SUPER = "Mod";
    SHIFT = "Shift";
    CTRL = "Ctrl";
    ALT = "Alt";
    RETURN = "Return";
    SPACE = "Space";
    LEFT = "Left";
    RIGHT = "Right";
    UP = "Up";
    DOWN = "Down";
    HOME = "Home";
    END = "End";
    TAB = "Tab";
  };

  mapToken = token: table.${token} or token;
in
{
  normalizeKeys =
    keys:
    if keys == [ ] then
      [ ]
    else if lib.isString (builtins.elemAt keys 0) then
      [ keys ]
    else
      keys;

  requireArg =
    keybind: name: value:
    if value == null then throw "Keybind action ${keybind.action} requires ${name}" else value;

  formatCombo =
    combo:
    if combo == [ ] then throw "Keybind keys combo cannot be empty" else lib.concatStringsSep "+" (map mapToken combo);

  spawnCommand =
    cmd: [
      "sh"
      "-c"
      cmd
    ];
}
