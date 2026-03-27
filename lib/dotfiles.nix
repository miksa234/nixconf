{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "d34c64e4bce1d1096d0ea68f5306f10d73ed1b69";
  };
}
