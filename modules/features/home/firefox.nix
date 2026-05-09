{ ... }:
{
  dendritic.modules.home.firefox =
    { inputs, lib, system, ... }:
    let
      homeDir = if lib.hasSuffix "-darwin" system then "/Users/mika" else "/home/mika";
    in
    {
      imports = [ inputs.betterfox.homeModules.betterfox ];

      programs.firefox = {
        enable = true;
        profiles = {
          frame = {
            id = 0;
            name = "frame";
            isDefault = true;
            settings = {
              "browser.toolbars.bookmarks.visibility" = "always";
              "browser.download.start_downloads_in_tmp_dir" = false;
              "browser.download.lastDir" = homeDir;
            };
          };
          mulmon = {
            id = 1;
            name = "mulmon";
            isDefault = false;
            settings = {
              "layout.css.devPixelsPerPx" = 0.9;
              "browser.toolbars.bookmarks.visibility" = "always";
              "browser.download.useDownloadDir" = true;
              "browser.download.start_downloads_in_tmp_dir" = false;
              "browser.download.lastDir" = homeDir;
            };
          };
        };
      };
    };
}
