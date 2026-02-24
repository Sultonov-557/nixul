{ lib, requireArg }:

keybind:
let
  raw = keybind.raw.hyprland;
  args = if keybind.args == null then { } else keybind.args;
  get = name: if builtins.hasAttr name args then builtins.getAttr name args else null;
  toStr = builtins.toString;

  directionVector =
    direction: amount:
    let
      step = requireArg keybind "amount" amount;
    in
    if direction == "l" then
      "-${toStr step} 0"
    else if direction == "r" then
      "${toStr step} 0"
    else if direction == "u" then
      "0 -${toStr step}"
    else if direction == "d" then
      "0 ${toStr step}"
    else
      throw "Unknown direction: ${direction}";

  mapped =
    if keybind.action == "spawn" then
      "exec,${requireArg keybind "cmd" (get "cmd")}"
    else if keybind.action == "close" then
      "killactive"
    else if keybind.action == "fullscreen" then
      "fullscreen,0"
    else if keybind.action == "float" then
      "togglefloating"
    else if keybind.action == "focus" then
      "movefocus,${requireArg keybind "direction" (get "direction")}"
    else if keybind.action == "movewindow" then
      "movewindow,${requireArg keybind "direction" (get "direction")}"
    else if keybind.action == "resize" then
      "resizeactive,${directionVector (requireArg keybind "direction" (get "direction")) (get "amount")}"
    else if keybind.action == "workspace" then
      "workspace,${toStr (requireArg keybind "workspace" (get "workspace"))}"
    else if keybind.action == "movetoworkspace" then
      "movetoworkspace,${toStr (requireArg keybind "workspace" (get "workspace"))}"
    else
      throw "Unknown keybind action: ${keybind.action}";
in
if raw != null then if lib.isString raw then [ raw ] else raw else [ mapped ]
