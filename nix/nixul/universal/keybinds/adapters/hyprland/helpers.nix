{ lib }:

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

  bindGroup =
    keybind:
    if keybind.mouse then
      "bindm"
    else if keybind.repeat then
      "binde"
    else
      "bind";
}
