{
  lib,
  mkBinding,
  normalizeKeys,
  formatCombo,
}:

keybinds:
let
  addEntry =
    acc: entry:
    acc // { ${entry.name} = entry.value; };

  addEntries =
    acc: entries:
    lib.foldl' addEntry acc entries;
in
lib.foldl' (
  acc: keybind:
  let
    combos = normalizeKeys keybind.keys;
    binding = mkBinding keybind;
    entries = map (combo: {
      name = formatCombo combo;
      value = binding;
    }) combos;
  in
  if combos == [ ] || (keybind.mouse && keybind.raw.niri == null) then acc else addEntries acc entries
) { } keybinds
