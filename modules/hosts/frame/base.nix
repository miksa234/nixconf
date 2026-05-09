{ ... }:
{
  dendritic.modules.nixos.frame-base =
    {
      hostName,
      inputs,
      systemName,
      dendritic,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
        inputs.home-manager.nixosModules.home-manager
        inputs.nixos-hardware.nixosModules.framework-13-7040-amd
      ];

      system.stateVersion = "26.05";

      sops.defaultSopsFile = ../../../secrets.yaml;
      sops.defaultSopsFormat = "yaml";
      sops.age.keyFile = "/home/mika/.config/sops/age/keys.txt";

      virtualisation.vmVariant = {
        virtualisation = {
          diskSize = 50 * 1028;
          memorySize = 16 * 1028;
          cores = 6;
          resolution = {
            x = 1600;
            y = 900;
          };
          qemu.options = [
            "-enable-kvm"
            "-cpu host"
            "-display gtk,zoom-to-fit=false"
            "-vga virtio"
          ];
        };
      };

      virtualisation.docker = {
        enable = true;
      };

      i18n.defaultLocale = "en_US.UTF-8";

      systemd = {
        network.links."10-wlan0" = {
          matchConfig.MACAddress = "14:AC:60:29:82:AB";
          linkConfig.Name = "wlan0";
        };
        sleep.settings.Sleep = {
          HibernateDelaySec = "20m";
        };
      };

      security.sudo.wheelNeedsPassword = false;
      security.pam.services.sddm.enableGnomeKeyring = true;
      security.rtkit.enable = true;
      security.pam.services.swaylock = {
        text = ''
          auth include login
        '';
      };

      powerManagement.powertop.enable = true;
      programs = {
        nix-ld.enable = true;
        zsh.enable = true;
        dconf.enable = true;
        gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };
      };

      environment.variables = {
        __ETC_ZSHRC_SOURCED = "1";
        __ETC_ZSHENV_SOURCED = "1";
      };

      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix.settings.max-jobs = lib.mkDefault 4;

      home-manager.extraSpecialArgs = {
        inherit
          dendritic
          hostName
          inputs
          systemName
          ;
        system = systemName;
        isSystemManagedHome = true;
      };
    };
}
