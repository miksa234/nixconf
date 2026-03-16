{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "3de6735d1c827c3e1a4795793420322201f6d24f";
  };
}
