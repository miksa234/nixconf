{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "39cd16b22920e5ccfb7175ea9bcdf0fec352cf06";
  };
}
