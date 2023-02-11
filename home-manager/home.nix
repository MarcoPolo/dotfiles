{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "codespace";
  home.homeDirectory = "/home/codespace";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    rnix-lsp
    neovim
    silver-searcher
    ripgrep
  ];
  home.sessionVariables = { EDITOR = "nvim"; FOO = "bar"; };

  # This is run in codespaces
  targets.genericLinux.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
  # programs.direnv.enableNixDirenvIntegration = true;

  programs.z-lua = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.broot = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

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


      export EDITOR=nvim
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
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "v1.12.0";
          sha256 = "1h04z7rxmca75sxdfjgmiyf1b5z2byfn6k4srls211l0wnva2r5y";
        };
      }
    ];
  };

  programs.git = {
    enable = true;
    userName = "Marco Munizaga";
    userEmail = "git@marcopolo.io";
    ignores = [
      ".direnv"
      ".calva"
      ".clj-kondo"
      ".lsp"
    ];
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
      type = "cat-file -t";
      dump = "cat-file -p";
      lg =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      lga =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all";
      lgd =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -p";
      df = "diff --color --color-words --abbrev";
      d = "difftool";
      up = "!git remote update -p; git merge --ff-only @{u}";
    };

    extraConfig = {
      merge = { conflictstyle = "diff3"; };
      push = { default = "current"; };
      color = {
        branch = "auto";
        diff = "auto";
        interactive = "auto";
        status = "auto";
      };
      pull = { ff = "only"; };
      rerere.enabled = true;
      init = {
        defaultBranch = "main";
      };
    };
  };


}
