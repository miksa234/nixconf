{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "3fffe315f53c8dce84c4ce8b9976d577befdd07b";
  };
}
