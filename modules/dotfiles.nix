{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "8f61cabca2066b6816820a0027badd804aaeaab0";
  };
}
