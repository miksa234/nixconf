{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "daad8e227346bffa9b5f6bf896231c139db9c58a";
  };
}
