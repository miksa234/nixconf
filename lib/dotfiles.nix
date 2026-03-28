{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "6211a793fac3de7772e78dbbce7f7b9158e2f719";
  };
}
