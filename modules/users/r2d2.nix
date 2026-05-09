{ ... }:
{
  dendritic.modules.home.r2d2 =
    {
      pkgs,
      lib,
      dendritic,
      config,
      ...
    }:
    let
      packageSets = dendritic.data.packageSets.default {
        inherit pkgs lib;
      };
      link = config.lib.file.mkOutOfStoreSymlink;
      inherit (dendritic.data.dotfiles) configDots configNvim;
      configDirs = builtins.attrNames (builtins.readDir "${configDots}/.config");
    in
    {
      home = {
        username = "r2d2";
        homeDirectory = "/home/r2d2";
        stateVersion = "25.11";

      };

      home.packages = lib.flatten (
        with packageSets;
        [
          shell
          cli
          network
          development
        ]
        ++ [ pkgs.lf ]
      );

      home.xdg.configFile =
        let
          filteredDirs = builtins.filter (dir: dir != "systemd") configDirs;
        in
        lib.genAttrs filteredDirs (dir: {
          source = link "${configDots}/.config/${dir}";
          recursive = true;
          force = true;
        });

      home.file = {
        ".zshenv" = {
          source = link "${configDots}/.zshenv";
          force = true;
        };
        ".local" = {
          source = link "${configDots}/.local";
          recursive = true;
          force = true;
        };
        ".config/nvim" = {
          source = link "${configNvim}";
          recursive = true;
          force = true;
        };
        ".config/nix-zsh-plugins.zsh".text = ''
          source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
          source ${pkgs.zsh-system-clipboard}/share/zsh/zsh-system-clipboard/zsh-system-clipboard.zsh
        '';
      };
    };
}
