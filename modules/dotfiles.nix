{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "16f7908b64b131dca39309e7e82b3ca364dcd187";

  };
  nvim-config = builtins.fetchGit {
    url = "git://popovic.xyz/config.nvim.git";
    ref = "master";
    rev = "59b8bcec9126fd8a0ca62aecb2c40dcf90175793";

  };
}
