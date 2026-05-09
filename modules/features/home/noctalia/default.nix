{ ... }:
{
  dendritic.modules.home.noctalia =
    {
      inputs,
      lib,
      dendritic,
      ...
    }:
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      config = {
        programs.noctalia-shell = {
          enable = true;
          colors = dendritic.data.noctaliaColors;
          settings = dendritic.data.noctaliaSettings // {
            bar = dendritic.data.noctaliaBar // {
              widgets = dendritic.data.noctaliaWidgets;
            };
          };
        };
      };
    };
}
