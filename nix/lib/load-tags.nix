let
  tagsRoot = ../nixul/tags/host;

  loadTags =
    tags:
    map (
      tag:
      let
        p = tagsRoot + "/${tag}.nix";
      in
      if builtins.pathExists p then
        import p
      else
        throw "nixul: unknown tag '${tag}' (expected ${toString p})"
    ) tags;
in
loadTags
