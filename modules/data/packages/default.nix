{
  config,
  ...
}:
{
  dendritic.data.packageSets.default =
    {
      pkgs,
      lib,
    }:
    let
      suckless = config.dendritic.data.packageSetSuckless {
        inherit pkgs lib;
      };
      systemSlice = config.dendritic.data.packageSetSystem {
        inherit pkgs lib;
      };
      desktopSlice = config.dendritic.data.packageSetDesktop {
        inherit pkgs lib suckless;
      };
      developmentSlice = config.dendritic.data.packageSetDevelopment {
        inherit pkgs;
      };
    in
    systemSlice // desktopSlice // developmentSlice;
}
