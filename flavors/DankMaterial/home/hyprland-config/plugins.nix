{
  wayland.windowManager.hyprland.settings = {
    plugin = {
      hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(111111)";
        workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1
        enable_gesture = true; # laptop touchpad
        gesture_fingers = 3; # 3 or 4
        gesture_distance = 300; # how far is the "max"
        gesture_positive = true; # positive = swipe down. Negative = swipe up.
      };

      split-monitor-workspaces = {
        count = 10;
        keep_focused = 0;
        enable_notifications = 0;
        enable_persistent_workspaces = 1;
      };

      hyprscrolling = {
        column_width = 1.0;
        follow_focus = true;
      };
    };
  };
}
