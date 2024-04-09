{
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  services.kanshi = {
    enable = true;
  };

  services.fnott = {
    enable = true;
    settings = {
      main = {
        background = "1e1e2ecc";
        border-color = "89b4faff";
        title-font = "JetBrainsMono Nerd Font:size=10";
        title-color = "cdd6f4ff";
        body-font = "JetBrainsMono Nerd Font:size=10";
        body-color = "cdd6f4ff";
        progress-bar-color = "313244ff";
        min-width = 300;
      };
    };
  };
}
