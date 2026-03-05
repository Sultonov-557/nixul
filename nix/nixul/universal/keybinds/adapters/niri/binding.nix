{
  lib,
  requireArg,
  spawnCommand,
}:

keybind:
let
  raw = keybind.raw.niri;
  args = if keybind.args == null then { } else keybind.args;
  get = name: if builtins.hasAttr name args then builtins.getAttr name args else null;

  directionAction =
    direction:
    if direction == "l" then
      { focus-column-left = [ ]; }
    else if direction == "r" then
      { focus-column-right = [ ]; }
    else if direction == "u" then
      { focus-window-up = [ ]; }
    else if direction == "d" then
      { focus-window-down = [ ]; }
    else
      throw "Unknown direction: ${direction}";

  moveAction =
    direction:
    if direction == "l" then
      { move-column-left = [ ]; }
    else if direction == "r" then
      { move-column-right = [ ]; }
    else if direction == "u" then
      { move-window-up = [ ]; }
    else if direction == "d" then
      { move-window-down = [ ]; }
    else
      throw "Unknown direction: ${direction}";

  resizeField =
    direction:
    if direction == "l" then
      "set-column-width"
    else if direction == "r" then
      "set-column-width"
    else if direction == "u" then
      "set-window-height"
    else if direction == "d" then
      "set-window-height"
    else
      throw "Unknown direction: ${direction}";

  base =
    if raw != null then
      if lib.isString raw then { action.spawn = spawnCommand raw; } else raw
    else if keybind.action == "spawn" then
      { action.spawn = spawnCommand (requireArg keybind "cmd" (get "cmd")); }
    else if keybind.action == "close" then
      { action.close-window = [ ]; }
    else if keybind.action == "fullscreen" then
      { action.fullscreen-window = [ ]; }
    else if keybind.action == "float" then
      { action.toggle-window-floating = [ ]; }
    else if keybind.action == "focus" then
      { action = directionAction (requireArg keybind "direction" (get "direction")); }
    else if keybind.action == "movewindow" then
      { action = moveAction (requireArg keybind "direction" (get "direction")); }
    else if keybind.action == "resize" then
      let
        direction = requireArg keybind "direction" (get "direction");
        field = resizeField direction;
        amount = requireArg keybind "amount" (get "amount");
        sign =
          if direction == "l" || direction == "u" then
            "-"
          else
            "+";
      in
      { action.${field} = "${sign}${toString amount}%"; }
    else if keybind.action == "workspace" then
      { action."focus-workspace" = requireArg keybind "workspace" (get "workspace"); }
    else if keybind.action == "movetoworkspace" then
      { action."move-column-to-workspace" = requireArg keybind "workspace" (get "workspace"); }
    else
      throw "Unknown keybind action: ${keybind.action}";
in
if keybind.repeat then base // { repeat = true; } else base

