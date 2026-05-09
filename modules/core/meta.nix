{ lib, inputs, ... }:
{
  options = {
    hostNames = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {
        frame = "frame";
        server = "server";
        mac = "mac";
      };
      description = "Mapping of configuration names to hostnames";
    };

    inputs = lib.mkOption {
      type = lib.types.attrs;
      default = inputs;
      readOnly = true;
      description = "Flake inputs";
    };
  };
}
