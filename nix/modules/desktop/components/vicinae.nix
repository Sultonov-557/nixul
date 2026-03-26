{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [
        pkgs.vicinae
      ];
    };

  home =
    { cfg, config, ... }:
    let
      extensionStore = pkgs.fetchFromGitHub {
        owner = "vicinaehq";
        repo = "extensions";
        rev = "8aa8860b9beed5e381fdc1729613fde31a16fef0";
        sha256 = "sha256-244lBhp82BQaGzZlLS5QsJ/GJP50AF8xYjBSS2rs+s4=";
      };
    in
    {
      programs.vicinae = lib.mkIf cfg.enable {
        enable = true;
        systemd = {
          enable = true;
          autoStart = true;
        };

        extensions = [
          (config.lib.vicinae.mkExtension {
            name = "nix";
            src = "${extensionStore}/extensions/nix";
          })
          (config.lib.vicinae.mkExtension {
            name = "agenda";
            src = "${extensionStore}/extensions/agenda";
          })
          (config.lib.vicinae.mkExtension {
            name = "github";
            src = "${extensionStore}/extensions/github";
          })
          (config.lib.vicinae.mkExtension {
            name = "hypr-keybinds";
            src = "${extensionStore}/extensions/hypr-keybinds";
          })
          (config.lib.vicinae.mkExtension {
            name = "it-tools";
            src = "${extensionStore}/extensions/it-tools";
          })
          (config.lib.vicinae.mkRayCastExtension {
            name = "gif-search";
            sha256 = "sha256-/59ZaKe6gUkemauakgSvwkb76kN3aciKHgAh2yYk6jI=";
            rev = "f1d8134c3d1373158c864b489ee3c0fdb436c9d3";
          })
        ];
      };
    };
  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable vicinae";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
