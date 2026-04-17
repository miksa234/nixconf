{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "16f7908b64b131dca39309e7e82b3ca364dcd187";

  };
  nvim-config = builtins.fetchGit {
    url = "git://popovic.xyz/config.nvim.git";
    ref = "master";
    rev = "8179b31d351c990ba1eda277816f7c5507a6d477";

  };
}
