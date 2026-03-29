{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "d16888435e04f5fef167655609d3c81de4b26e8b";
  };
}
