{ ... }:
{
  dendritic.modules.darwin.mac-packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        coreutils
        stdenv
        pciutils
        util-linux
        pstree
        wireguard-tools
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.terminess-ttf
        terminus_font
      ];
    };
}
