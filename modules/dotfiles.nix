{
  dotfiles = builtins.fetchGit {
    url = "git://popovic.xyz/dots.git";
    ref = "master";
    rev = "94a20506fcefacd2ab180b04a97c8d331383e8ac";

  };
  nvim-config = builtins.fetchGit {
    url = "git://popovic.xyz/config.nvim.git";
    ref = "master";
    rev = "1f3cb04dbfd0597173cbed5f791185b40a6e99ea";

  };
}
