{ ... }:
{
  dendritic.configs.nixos.server.modules = [
    "server-base"
    "server-hardware"
    "nix-settings"
    "r2d2"
    "root"
  ];
}
