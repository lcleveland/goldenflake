{ pkgs, ... }: {
  pkgs.neovim.override = {
    withNodeJs = true;
  };
}
