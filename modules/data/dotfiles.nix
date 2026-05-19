{ ... }:
{
  dendritic.data.dotfiles = {
    configDots = builtins.fetchGit {
      url = "https://github.com/miksa234/config.git";
      ref = "master";
      rev = "40ce8e88b8e50ba85dabc8a5088d5b3291c1117f";
    };

    configNvim = builtins.fetchGit {
      url = "https://github.com/miksa234/config.nvim.git";
      ref = "main";
      rev = "a3e046a7372e4dd14749a8148f5c6cca1eb15745";
    };
  };
}
