{
  keybinds =
    let
      workspace = number: {
        keys = [
          [
            "SUPER"
            (toString number)
          ]
        ];
        action = "workspace";
        args = {
          workspace = number;
        };
      };

      moveWorkspace = number: {
        keys = [
          [
            "SUPER"
            "SHIFT"
            (toString number)
          ]
        ];
        action = "movetoworkspace";
        args = {
          workspace = number;
        };
      };
    in
    (builtins.genList (n: workspace (n + 1)) 9) ++ (builtins.genList (n: moveWorkspace (n + 1)) 9);
}
