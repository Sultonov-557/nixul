{
  services.dashy = {
    enable = true;

    settings =
      let
        mediaItems = [
          {
            title = "Youtube";
            icon = "si-youtube";
            url = "https://youtube.com/";
            statusCheck = false;
          }
        ];

        productivityItems = [
          {
            title = "Gmail";
            icon = "si-gmail";
            url = "https://gmail.com/";
            statusCheck = false;
          }
          {
            title = "Notion";
            icon = "si-notion";
            url = "https://www.notion.so/";
            statusCheck = false;
          }
          {
            title = "Todoist";
            icon = "si-todoist";
            url = "https://app.todoist.com/";
            statusCheck = false;
          }
        ];

        developmentItems = [
          {
            title = "Github";
            icon = "si-github";
            url = "https://github.com/";
            statusCheck = false;
          }
          {
            title = "Docker Hub";
            icon = "si-docker";
            url = "https://hub.docker.com/";
            statusCheck = false;
          }
          {
            title = "NixOS Packages";
            icon = "si-nixos";
            url = "https://search.nixos.org/packages";
            statusCheck = false;
          }
          {
            title = "NixOS Options";
            icon = "si-nixos";
            url = "https://mynixos.com/";
            statusCheck = false;
          }
        ];

        learningItems = [
          {
            title = "ChatGPT";
            icon = "si-chatbot";
            url = "https://chat.openai.com/";
            statusCheck = false;
          }
          {
            title = "Stack Overflow";
            icon = "si-stackoverflow";
            url = "https://stackoverflow.com/";
            statusCheck = false;
          }
          {
            title = "MDN Web Docs";
            icon = "si-mdnwebdocs";
            url = "https://developer.mozilla.org/";
            statusCheck = false;
          }
          {
            title = "Wikipedia";
            icon = "si-wikipedia";
            url = "https://www.wikipedia.org/";
            statusCheck = false;
          }
        ];
      in
      {
        pageInfo = {
          title = "Home";
          logo = "http://public.home/logo.png";
        };
        sections = [
          {
            name = "Media";
            icon = "si-music";
            items = mediaItems;
          }
          {
            name = "Productivity";
            icon = "si-google";
            items = productivityItems;
            widgets = [
              {
                type = "github-profile-stats";
                options = {
                  username = "sultonov557";
                };
              }
            ];
          }
          {
            name = "Development";
            icon = "si-codeproject";
            items = developmentItems;
          }
          {
            name = "Learning";
            icon = "si-readthedocs";
            items = learningItems;
          }
        ];

        appConfig = {
          startingView = "minimal";
          theme = "glass";
          webSearch = {
            searchEngine = "google";
          };
          statusCheck = true;

          hideComponents = {
            hideFooter = true;
          };
          preventWriteToDisk = true;
          preventLocalSave = true;
          disableConfiguration = false;
          showSplashScreen = true;

          customCss = ''
            body {
             background:transparent !important;
            }'';
        };
      };
  };
}
