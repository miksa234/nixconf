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
      home.mika =
        args@{
          pkgs,
          lib,
          dendritic,
          config,
          ...
        }:
        let
          isSystemManagedHome = args.isSystemManagedHome or false;
          link = config.lib.file.mkOutOfStoreSymlink;
          isDarwin = pkgs.stdenv.isDarwin;
          homeDir = if isDarwin then "/Users/mika" else "/home/mika";
          packageSets = dendritic.data.packageSets.default {
            inherit pkgs lib;
          };
          inherit (dendritic.data.dotfiles) configDots configNvim;
          configDirs = builtins.attrNames (builtins.readDir "${configDots}/.config");
        in
        {
          home = {
            username = "mika";
            homeDirectory = homeDir;
            packages = lib.flatten (
              with packageSets;
              [
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
                # xorg
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
              excludedDirs = [
                "systemd"
                "nix"
              ];
              filteredDirs = builtins.filter (dir: !(builtins.elem dir excludedDirs)) configDirs;
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

      nixos.mika =
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
            imports = homeProfileModules dendritic "mika";
          };
        };

      darwin.mika =
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
