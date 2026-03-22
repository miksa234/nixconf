{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "a0e01e0b9494bdfd8ee7bd58afc2638639ef0859";
  };
}
