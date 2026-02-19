{ lib, config, ... }:
{
  imports = [ ./keybinds ];

  options.nixul = {
    user = lib.mkOption {
      type = lib.types.str;
      description = "name of the user";
    };
    email = lib.mkOption {
      type = lib.types.str;
      description = "email of the user";
    };
    hostname = lib.mkOption {
      type = lib.types.str;
      description = "hostname of the machine";
    };
    timezone = lib.mkOption {
      type = lib.types.str;
      description = "timezone of the machine";
    };
    location = lib.mkOption {
      type = lib.types.str;
      description = "location of the machine for weather etc...";
    };
    enableAllModules = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable every module by default";
    };
  };
  config = {
    networking.hostName = config.nixul.hostname;
  };
}
