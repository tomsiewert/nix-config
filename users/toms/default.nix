{ config, inputs, ... }:

{
  imports = [
    ./base.nix
    ./emacs.nix
    ./fzf.nix
    ./git.nix
    ./go.nix
    ./gpg.nix
    ./home-manager.nix
    ./i3.nix
    ./intellij.nix
    ./rofi.nix
    ./ssh.nix
    ./tmux.nix
    ./vscode.nix
    ./zsh.nix
    ./kitty.nix
  ];
}
