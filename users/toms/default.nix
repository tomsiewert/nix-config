{ config, inputs, ... }:

{
  imports = [
    ./base.nix
    ./fzf.nix
    ./git.nix
    ./go.nix
    ./gpg.nix
    ./home-manager.nix
    ./i3.nix
    ./intellij.nix
    ./rofi.nix
    ./tmux.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
