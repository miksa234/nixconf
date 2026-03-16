{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "2c6c50b45dfc7c6667e9a816b8d7f002889e2efe";
  };
}
