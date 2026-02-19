{
  lib,
  actions,
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
      actions."focus-column-left"
    else if direction == "r" then
      actions."focus-column-right"
    else if direction == "u" then
      actions."focus-window-up"
    else if direction == "d" then
      actions."focus-window-down"
    else
      throw "Unknown direction: ${direction}";

  moveAction =
    direction:
    if direction == "l" then
      actions."move-column-left"
    else if direction == "r" then
      actions."move-column-right"
    else if direction == "u" then
      actions."move-window-up"
    else if direction == "d" then
      actions."move-window-down"
    else
      throw "Unknown direction: ${direction}";

  resizeField =
    direction:
    if direction == "l" then
      "resize-window-left"
    else if direction == "r" then
      "resize-window-right"
    else if direction == "u" then
      "resize-window-up"
    else if direction == "d" then
      "resize-window-down"
    else
      throw "Unknown direction: ${direction}";

  base =
    if raw != null then
      if lib.isString raw then { action.spawn = spawnCommand raw; } else raw
    else if keybind.action == "spawn" then
      { action.spawn = spawnCommand (requireArg keybind "cmd" (get "cmd")); }
    else if keybind.action == "close" then
      { action = actions."close-window"; }
    else if keybind.action == "fullscreen" then
      { action = actions."fullscreen-window"; }
    else if keybind.action == "float" then
      { action = actions."toggle-window-floating"; }
    else if keybind.action == "focus" then
      { action = directionAction (requireArg keybind "direction" (get "direction")); }
    else if keybind.action == "movewindow" then
      { action = moveAction (requireArg keybind "direction" (get "direction")); }
    else if keybind.action == "resize" then
      let
        direction = requireArg keybind "direction" (get "direction");
        field = resizeField direction;
        amount = requireArg keybind "amount" (get "amount");
      in
      { action.${field} = amount; }
    else if keybind.action == "workspace" then
      { action."focus-workspace" = requireArg keybind "workspace" (get "workspace"); }
    else if keybind.action == "movetoworkspace" then
      { action."move-column-to-workspace" = requireArg keybind "workspace" (get "workspace"); }
    else
      throw "Unknown keybind action: ${keybind.action}";
in
if keybind.repeat then base // { repeat = true; } else base
