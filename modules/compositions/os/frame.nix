{ ... }:
{
  dendritic.configs.nixos.frame.modules = [
    "frame-hardware"
    "frame-boot"
    "frame-base"
    "frame-services"
    "frame-desktop"
    "frame-packages"
    "nix-settings"
    "networkmanager"
    "mika"
    "root"
  ];
}
