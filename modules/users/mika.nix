{ ... }:
{
  dendritic.modules =
    let
      resolveHomeModule =
        dendritic: profileName: moduleName:
        if builtins.hasAttr moduleName dendritic.modules.home then
          builtins.getAttr moduleName dendritic.modules.home
        else
          throw "Unknown dendritic Home Manager module `${moduleName}` for profile `${profileName}`.";

      homeProfileModules =
        dendritic: profileName:
        let
          profile =
            if builtins.hasAttr profileName dendritic.configs.home then
              builtins.getAttr profileName dendritic.configs.home
            else
              throw "Unknown dendritic Home Manager profile `${profileName}`.";
        in
        map (resolveHomeModule dendritic profileName) profile.modules;
    in
    {
      home.user-mika =
        {
          pkgs,
          lib,
          dendritic,
          isDarwin,
          isSystemManagedHome,
          config,
          ...
        }:
        let
          link = config.lib.file.mkOutOfStoreSymlink;
          inherit (dendritic.data.dotfiles) configDots configNvim;
          configDirs = builtins.attrNames (builtins.readDir "${configDots}/.config");
        in
        {
          home = {
            username = "mika";
            packages = lib.flatten (
              with dendritic.data.packageSets.default {
                inherit pkgs lib isDarwin;
              };
              [
                system
                shell
                cli
                media
                fileManagement
                communication
                network
                office
                fonts
                email
                development
                wayland
                #xorg
              ]
            );

            stateVersion = if isDarwin then "25.11" else "26.05";

            file = {
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

          xdg.configFile =
            let
              filteredDirs = builtins.filter (dir: dir != "systemd") configDirs;
            in
            lib.genAttrs filteredDirs (dir: {
              source = link "${configDots}/.config/${dir}";
              recursive = true;
              force = true;
            });

        }
        // lib.optionalAttrs (!isSystemManagedHome) {
          nixpkgs.config.allowUnfree = true;
        };

      nixos.user-mika =
        { pkgs, dendritic, ... }:
        {
          users.users.mika = {
            isNormalUser = true;
            description = "mika";
            extraGroups = [
              "networkmanager"
              "wheel"
              "docker"
              "kvm"
              "libvirtd"
            ];
            shell = pkgs.zsh;
          };

          home-manager.users.mika = {
            home.homeDirectory = "/home/mika";
            imports = homeProfileModules dendritic "mika";
          };
        };

      darwin.user-mika =
        { pkgs, dendritic, ... }:
        {
          users.users.mika = {
            shell = pkgs.zsh;
            home = "/Users/mika";
          };

          system.primaryUser = "mika";

          home-manager.users.mika = {
            imports = homeProfileModules dendritic "mika";
          };
        };
    };
}
