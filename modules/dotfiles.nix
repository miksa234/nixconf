{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "18ca191d39710b320ffbed04e808d84dc19ef78b";

  };
  nvim-config = builtins.fetchGit {
    url = "git://popovic.xyz/config.nvim.git";
    ref = "master";
    rev = "245555e22829a513703b9a0c6508a6cc35492e0a";

  };
}
