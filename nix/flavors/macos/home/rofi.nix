{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "${pkgs.ghostty}/bin/ghostty";

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      display-drun = "";
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = true;
      sidebar-mode = false;
    };

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          bg = mkLiteral "#1E1E1EE6";
          bg-alt = mkLiteral "#2D2D2D";
          fg = mkLiteral "#FFFFFF";
          fg-alt = mkLiteral "#8E8E93";

          border-color = mkLiteral "#0A84FF";
          selected = mkLiteral "#0A84FF20";
          selected-text = mkLiteral "#0A84FF";

          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg";

          font = "Inter 12";
        };

        "window" = {
          transparency = "real";
          background-color = mkLiteral "@bg";
          border = mkLiteral "2px";
          border-color = mkLiteral "@border-color";
          border-radius = mkLiteral "12px";
          width = mkLiteral "600px";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
        };

        "mainbox" = {
          children = mkLiteral "[inputbar, listview]";
          padding = mkLiteral "20px";
        };

        "inputbar" = {
          children = mkLiteral "[prompt, entry]";
          spacing = mkLiteral "12px";
          padding = mkLiteral "12px";
          border-radius = mkLiteral "8px";
          background-color = mkLiteral "@bg-alt";
        };

        "prompt" = {
          enabled = true;
          text-color = mkLiteral "@selected-text";
        };

        "entry" = {
          placeholder = "Search...";
          placeholder-color = mkLiteral "@fg-alt";
        };

        "listview" = {
          background-color = mkLiteral "transparent";
          columns = mkLiteral "1";
          lines = mkLiteral "8";
          spacing = mkLiteral "4px";
          cycle = false;
          dynamic = true;
          layout = mkLiteral "vertical";
          margin = mkLiteral "12px 0 0 0";
        };

        "element" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg";
          padding = mkLiteral "10px 12px";
          border-radius = mkLiteral "8px";
        };

        "element selected" = {
          background-color = mkLiteral "@selected";
          text-color = mkLiteral "@selected-text";
        };

        "element-icon" = {
          size = mkLiteral "24px";
          background-color = mkLiteral "transparent";
          margin = mkLiteral "0 8px 0 0";
        };

        "element-text" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
        };
      };
  };
}
