{ lib, config, ... }:

let
  inherit (lib)
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

  actionMap =
    kb:
    if kb.action == "spawn" then
      "exec,${kb.cmd}"
    else if kb.action == "close" then
      "killactive"
    else if kb.action == "fullscreen" then
      "fullscreen,1"
    else
      throw "Unknown keybind action: ${kb.action}";

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
      command = actionMap kb;

      mkOne =
        combo:
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
    map mkOne combos;

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
