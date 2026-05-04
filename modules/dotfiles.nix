{
  dotfiles = builtins.fetchGit {
    url = "https://github.com/miksa234/config.git";
    ref = "master";
    rev = "40ce8e88b8e50ba85dabc8a5088d5b3291c1117f";

  };
  nvim-config = builtins.fetchGit {
    url = "https://github.com/miksa234/config.nvim.git";
    ref = "main";
    rev = "8e5b8363305b8aa082f782a563d6b49c93c97ab8";

  };
}
