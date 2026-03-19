{ loadUserTags, lib, ... }:
{
  nixul = {
    primaryUser = "example";
    users.example = {
      email = "example@example.com";

      modules =
        lib.recursiveUpdate
          (loadUserTags [
            "core"
            "apps"
            "desktop"
            "development"
          ])
          { };
    };
  };
}
