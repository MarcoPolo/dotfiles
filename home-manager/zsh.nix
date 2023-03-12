{ extraInitExtra }: { pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    defaultKeymap = "viins";
    initExtra = ''
      # Edit command in vim
      autoload -U edit-command-line
      zle -N edit-command-line
      bindkey -M vicmd v edit-command-line


      # set $_ZL_HYPHEN to 1 to treat hyphon (-) as a normal character not a lua regexp keyword.
      export _ZL_HYPHEN=1

      # fpath+=$HOME/.zsh/typewritten
      autoload -U promptinit; promptinit
      prompt typewritten


      export EDITOR=nvim

      ${extraInitExtra}
    '';
    # nix-index is broken on m1
    # Better command not found
    # source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    shellAliases = { vim = "nvim"; };
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "async";
        src = pkgs.fetchFromGitHub {
          owner = "mafredri";
          repo = "zsh-async";
          rev = "v1.8.0";
          sha256 = "02p4ll1f3sibjxbywx3a7ql758ih27vd9sx4nl9j0i64hwkdqfrb";
        };
      }
      {
        name = "history";
        file = "lib/history.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "ohmyzsh";
          repo = "ohmyzsh";
          rev = "b721053c87b4662c65452117a8db35af0154a29d";
          sha256 =
            "sha256:02y6mhvsxamsvfx2bcdrfbbl7g8v1cq8qycjbffn4w3d6aprq5c6";
        };
      }
      {
        name = "typewritten";
        src = pkgs.fetchFromGitHub {
          owner = "reobin";
          repo = "typewritten";
          rev = "v1.5.1";
          sha256 = "sha256-qiC4IbmvpIseSnldt3dhEMsYSILpp7epBTZ53jY18x8=";
        };
      }
    ];
  };
}
