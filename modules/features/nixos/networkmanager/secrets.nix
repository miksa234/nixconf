{ ... }:
{
  dendritic.modules.nixos.networkmanager-secrets =
    { inputs, config, ... }:
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      sops.defaultSopsFile = ./secrets.yaml;
      sops.defaultSopsFormat = "yaml";
      sops.age.keyFile = "/etc/sops/age/keys.txt";

      sops = {
        secrets = {
          "networking/gajba" = { };
          "networking/wg0_ponnect_prv" = { };
          "networking/wg0_ponnect_pre" = { };
          "networking/wg0_router_prv" = { };
          "networking/wg0_server_prv" = { };
          "networking/wg0_server_pre" = { };
        };
        templates.wifi = {
          content = ''
            Gajba=${config.sops.placeholder."networking/gajba"}
            wg0_ponnect_prv=${config.sops.placeholder."networking/wg0_ponnect_prv"}
            wg0_ponnect_pre=${config.sops.placeholder."networking/wg0_ponnect_pre"}
            wg0_router_prv=${config.sops.placeholder."networking/wg0_router_prv"}
            wg0_server_prv=${config.sops.placeholder."networking/wg0_server_prv"}
            wg0_server_pre=${config.sops.placeholder."networking/wg0_server_pre"}
          '';
        };
      };
    };
}
