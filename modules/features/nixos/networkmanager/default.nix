{ ... }:
{
  dendritic.modules.nixos.networkmanager =
    {
      config,
      dendritic,
      hostName,
      ...
    }:
    {
      imports = [
        dendritic.modules.nixos.networkmanager-secrets
        dendritic.modules.nixos.networkmanager-dispatcher
      ];


      networking.hostName = hostName;
      networking.firewall.enable = false;
      networking.networkmanager = {
        enable = true;
        ensureProfiles = {
          environmentFiles = [ config.sops.templates.wifi.path ];
          profiles =
            dendritic.data.networkmanagerProfilesGajba
            // dendritic.data.networkmanagerProfilesWireguard;
        };
      };
    };
}
