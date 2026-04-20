{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "16f7908b64b131dca39309e7e82b3ca364dcd187";

  };
  nvim-config = builtins.fetchGit {
    url = "git://popovic.xyz/config.nvim.git";
    ref = "master";
    rev = "f12d41dd8ae96fd36d534a944606438bb649c813";

  };
}
