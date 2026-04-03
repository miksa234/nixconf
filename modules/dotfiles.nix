{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "77e6504385113bb99ed92200909f6fb3e42bf210";
  };
}
