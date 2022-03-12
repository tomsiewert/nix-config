{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.4.0";
            sha256 = "037wz9fqmx0ngcwl9az55fgkipb745rymznxnssr3rx9irb6apzg";
          };
        }
      ];
      localVariables = {
        "EDITOR" = "vim";
        "GPG_TTY" = "$(tty)";

        "FZF_COMPLETION_TRIGGER" = "**";
      };
      shellAliases = {
        "vi" = "vim";
        "sa" = "ssh-add ~/.ssh/id_siewert";
        "ap" = "ansible-playbook";
        "a" = "ansible";
        "al" = "ansible-lint";
        "k" = "kubectl";
      };
      initExtra = "
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$(hostname).sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  ssh-agent -a \"$SSH_AUTH_SOCK\" >/dev/null
fi
      ";
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "kubectl" "rails" "ruby" "fzf" ];
        theme = "robbyrussell";
      };
    };
  };
}
