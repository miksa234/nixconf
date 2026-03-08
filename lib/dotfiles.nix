{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "958ed4ebba453b876a9750e7b9b8c2bcd05631ab";
  };
}
