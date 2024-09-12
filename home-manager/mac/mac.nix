# see: man home-configuration.nix
{ pkgs, lib, config, ... }: {
  imports = [
    ../neovim/default.nix
    (import ../zsh.nix {
      extraInitExtra = ''
        export PATH=$PATH:~/.cargo/bin
        export PATH=$PATH:~/.bin
        export PATH=$PATH:/usr/local/go/bin
        export USER_ZDOTDIR=~/
        . "$HOME/.cargo/env"
      '';
    })
  ];

  sops = {
    age.keyFile = "/Users/marco/.ssh/age-key.txt";
    secrets.sshconf = {
      format = "binary";
      sopsFile = ./secret-ssh.conf; # optionally define per-secret files
      path = "/Users/marco/.ssh/secret-ssh.conf";
    };
  };
  home = {
    username = "marco";
    homeDirectory = "/Users/marco";
    shellAliases = { };
    stateVersion = "24.05";
    sessionVariables = {
    EDITOR = "nvim"; FOO = "bar";

    };
    sessionPath = [ "/sbin" "/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin" ];
    packages = with pkgs; [
      cmake
      zellij
      atuin
      tree
      babashka
      watchexec
      graphviz
      kitty
      nixpkgs-fmt
      htop
      cacert
      gnupg
      git-crypt
      silver-searcher
      ripgrep
      gh
      wget
      mosh
      jq
      wasmtime
    ];

    file =
      if pkgs.stdenv.hostPlatform.isDarwin then {
        nix-conf = {
          source = ./mac-nix.conf;
          target = ".config/nix/nix.conf";
        };
      } else
        { };
  };


  programs.gpg = {
    enable = true;
    settings = {
      default-key = "413CB18A1EA1D6B0281E348AE747E431D981A953";
    };

  };

  programs.git = {
    signing = {
      key = "E747E431D981A953";
      signByDefault = true;
    };
  };

  programs.ssh = {
    enable = true;
    controlMaster = "auto";
    includes = [ "/Users/marco/.ssh/secret-ssh.conf" ];
    extraConfig = ''
      IdentityAgent /Users/marco/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
    '';
  };
  programs.tmux = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      ''
        bind-key -n F10 previous-window
        bind-key -n F11 next-window
        bind-key C-b last-window
      ''
    ];
    plugins = with pkgs.tmuxPlugins; [ gruvbox ];
    escapeTime = 0;
    keyMode = "vi";
    newSession = true;
    terminal = "xterm-256color";
  };
}
