{ ... }: {
  nixpkgs.neovim.override = {
    withNodeJs = true;
  };
}
