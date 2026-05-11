{ ... }:
{
  dendritic.modules.nixos.frame-desktop =
    { ... }:
    {
      services = {
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };
        getty.autologinUser = "mika";
        logind.settings.Login = {
          SleepOperation = "suspend-then-hibernate";
          HandlePowerKey = "suspend-then-hibernate";
          HandleLidSwitch = "suspend-then-hibernate";
          HandlePowerKeyLongPress = "poweroff";
        };
        gnome.gnome-keyring.enable = true;
        xserver = {
          enable = true;
          serverFlagsSection = ''
            Option "Xauth" "$XAUTHORITY"
          '';
          displayManager.startx.enable = true;
        };
      };

      services.libinput = {
        enable = true;
        touchpad = {
          naturalScrolling = false;
          tapping = true;
          clickMethod = "clickfinger";
        };
      };
    };
}
