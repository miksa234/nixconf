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
      rev = "b9e30f7d5fe7eaa4fb51c843f4c5f21b15a77961";
    };
  };
}
