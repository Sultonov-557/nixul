{
  services.dashy = {
    enable = true;
    virtualHost = {
      enableNginx = true;
      domain = "dashy.home";
    };

    settings = {
      pageInfo = {
        title = "Home";
        logo = "http://public.home/logo.png";
      };
      sections = [
        {
          name = "Media";
          icon = "mdi:music";
          items = [
            {
              title = "Youtube";
              icon = "si-youtube";
              url = "https://youtube.com/";
              statusCheckUrl = "https://youtube.com/";
            }
            {
              title = "Github";
              icon = "si-github";
              url = "https://github.com/";
              statusCheckUrl = "https://github.com/";
            }
            {
              title = "ChatGPT";
              icon = "si-chatgpt";
              url = "https://chat.openai.com/";
              statusCheckUrl = "https://chat.openai.com/";
            }
            {
              title = "Gmail";
              icon = "si-gmail";
              url = "https://gmail.com/";
              statusCheckUrl = "https://gmail.com/";
            }
          ];
        }
      ];

      appConfig = {
        startingView = "minimal";
        webSearch = {
          searchEngine = "google";
        };
        statusCheck = true;

        hideComponents = {
          hideFooter = true;
        };
        preventWriteToDisk = true;
        preventLocalSave = true;
        disableConfiguration = false; # TODO set true later
        showSplashScreen = true;

        customCss = ''
          body header #dashy .normal .home .settings-outer .options-outer .options-container{
           background:transparent !important;
          }'';
      };
    };
  };
}
