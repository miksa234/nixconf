{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "16f7908b64b131dca39309e7e82b3ca364dcd187";

  };
  nvim-config = builtins.fetchGit {
    url = "git://popovic.xyz/config.nvim.git";
    ref = "master";
    rev = "08e0b1d01183f6cade6e29420d46a6e6aecdf115";

  };
}
