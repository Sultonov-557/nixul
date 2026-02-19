{ lib, config, ... }:

let
  inherit (lib)
    concatMap
    concatStringsSep
    foldl'
    isString
    ;

  normalizeKeys =
    keys:
    if keys == [ ] then
      [ ]
    else if isString (builtins.elemAt keys 0) then
      [ keys ]
    else
      keys;

  requireArg =
    kb: name: value:
    if value == null then throw "Keybind action ${kb.action} requires ${name}" else value;

  hyprCommands =
    kb:
    let
      raw = kb.raw.hyprland;
      args = if kb.args == null then { } else kb.args;
      get = name: if builtins.hasAttr name args then builtins.getAttr name args else null;
      toStr = builtins.toString;

      directionVector =
        direction: amount:
        let
          step = requireArg kb "amount" amount;
        in
        if direction == "l" then
          "-${toString step} 0"
        else if direction == "r" then
          "${toString step} 0"
        else if direction == "u" then
          "0 -${toString step}"
        else if direction == "d" then
          "0 ${toString step}"
        else
          throw "Unknown direction: ${direction}";

      mapped =
        if kb.action == "spawn" then
          "exec,${requireArg kb "cmd" (get "cmd")}"
        else if kb.action == "close" then
          "killactive"
        else if kb.action == "fullscreen" then
          "fullscreen,0"
        else if kb.action == "float" then
          "togglefloating"
        else if kb.action == "focus" then
          "movefocus,${requireArg kb "direction" (get "direction")}"
        else if kb.action == "movewindow" then
          "movewindow,${requireArg kb "direction" (get "direction")}"
        else if kb.action == "resize" then
          "resizeactive,${directionVector (requireArg kb "direction" (get "direction")) (get "amount")}"
        else if kb.action == "workspace" then
          "workspace,${toStr (requireArg kb "workspace" (get "workspace"))}"
        else if kb.action == "movetoworkspace" then
          "movetoworkspace,${toStr (requireArg kb "workspace" (get "workspace"))}"
        else
          throw "Unknown keybind action: ${kb.action}";
    in
    if raw != null then if isString raw then [ raw ] else raw else [ mapped ];

  bindGroup =
    kb:
    if kb.mouse then
      "bindm"
    else if kb.repeat then
      "binde"
    else
      "bind";

  mkLines =
    kb:
    let
      combos = normalizeKeys kb.keys;
      commands = hyprCommands kb;

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
            mods = concatStringsSep " " modsList;
          in
          "${mods},${key},${command}";
    in
    concatMap (combo: map (command: mkOne command combo) commands) combos;

  mkSettings = foldl' (
    acc: kb:
    let
      group = bindGroup kb;
      lines = mkLines kb;
      prev = acc.${group} or [ ];
    in
    acc // { ${group} = prev ++ lines; }
  ) { };
in
{
  home-manager.users.${config.nixul.user} = {
    wayland.windowManager.hyprland.settings = mkSettings config.nixul.keybinds;
  };
}
