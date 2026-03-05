{ mkBookmarks, config }:

let
  bookmarkGroups = mkBookmarks config.nixul.host.bookmarks;
in
{
  services.glance.settings.pages = [
    {
      name = "Home";
      hide-desktop-navigation = false;
      columns = [
        {
          size = "small";
          widgets = [
            {
              type = "clock";
              hour-format = "24h";
            }
            {
              type = "weather";
              location = "Paris, France";
            }
          ];
        }
        {
          size = "full";
          widgets = [
            {
              type = "search";
              search-engine = "google";
            }
            {
              type = "group";
              widgets = [
                {
                  type = "bookmarks";
                  title = "Bookmarks";
                  groups = bookmarkGroups;
                }
              ];
            }
            {
              type = "hacker-news";
              limit = 15;
              collapse-after = 5;
            }
          ];
        }
      ];
    }
  ];
}

