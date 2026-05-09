{ ... }:
let
  rootHomeManager =
    {
      dendritic,
      lib,
      isDarwin ? false,
      config,
      ...
    }:
    let
      inherit (dendritic.data.dotfiles) configDots configNvim;
    in
    {
      environment.pathsToLink = lib.optionals (!isDarwin) [
        "/share/applications"
        "/share/xdg-desktop-portal"
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";

        users.root =
          { config, ... }:
          {
            home = {
              username = "root";
              stateVersion = if isDarwin then "25.05" else "25.11";
              file =
                let
                  mkDotfileLink = path: {
                    source = config.lib.file.mkOutOfStoreSymlink "${configDots}/${path}";
                    recursive = true;
                    force = true;
                  };
                  mkNvimfileLink = path: {
                    source = config.lib.file.mkOutOfStoreSymlink "${configNvim}";
                    recursive = true;
                    force = true;
                  };
                in
                {
                  ".zshenv" = mkDotfileLink ".zshenv";
                  ".config/zsh/.zshrc" = mkDotfileLink ".config/zsh/.zshrc";
                  ".config/shell/bindings" = mkDotfileLink ".config/shell/bindings";
                  ".config/shell/profile" = mkDotfileLink ".config/shell/profile";
                  ".config/shell/aliases" = mkDotfileLink ".config/shell/aliases";
                  ".config/git" = mkDotfileLink ".config/git";
                  ".local/bin/.keep".text = "";
                  ".config/nvim/init.lua" = mkNvimfileLink ".config/nvim/init.lua";
                  ".config/nvim/after" = mkNvimfileLink ".config/nvim/after";
                  ".config/nvim/lua/config" = mkNvimfileLink ".config/nvim/lua/config";
                };
            }
            // lib.optionalAttrs (!isDarwin) {
              homeDirectory = "/root";
            };
          };
      };
    };
in
{
  dendritic.modules.nixos.root =
    { pkgs, ... }:
    {
      imports = [ rootHomeManager ];

      users.users.root.shell = pkgs.zsh;
    };

  dendritic.modules.darwin.root =
    { pkgs, ... }:
    {
      imports = [ rootHomeManager ];

      users.users.root = {
        shell = pkgs.zsh;
        home = "/var/root";
      };
    };
}
