{ ... }: {
  imports = [
    ./git.nix
    ./steam.nix
    ./dconf.nix
    ./nixvim.nix
    ./strongswan.nix
    ./tmux.nix
    ./zsh.nix
    ./kitty.nix
    ./gtk.nix
    ./dns.nix
  ];
}