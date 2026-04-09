{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "7d5ac0291469188e5ccba679876726cc970a5da3";
  };
}
