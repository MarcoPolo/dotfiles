{ config, pkgs, ... }:

{

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    mosh
    silver-searcher
    ripgrep
  ];

  programs.tmux = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      ''
        bind-key C-b last-window
      ''
    ];
    plugins = with pkgs.tmuxPlugins; [ ];
    escapeTime = 0;
    keyMode = "vi";
    newSession = true;
    terminal = "xterm-256color";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  # programs.z-lua = {
    # enable = true;
    # enableZshIntegration = true;
  # };

  programs.broot = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
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
      ".DS_Store"
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
