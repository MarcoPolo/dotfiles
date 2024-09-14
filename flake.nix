{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-neovim.url = "github:nixos/nixpkgs/5629520edecb69630a3f4d17d3d33fc96c13f6fe";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    mac-app-util.url = "github:hraban/mac-app-util";
    flake-utils.url = "github:numtide/flake-utils";
    sops-nix.url = "github:Mic92/sops-nix";
    zellij.url = "github:a-kenji/zellij-nix";
    atuin.url = "github:atuinsh/atuin";
  };


  outputs = inputs@{ self, nixpkgs, nixpkgs-neovim, flake-utils, zellij, mac-app-util, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        neovim-pkgs = (import nixpkgs-neovim { system = system; });
        pkgs = import nixpkgs { 
		system = system; 
      neovim = (import nixpkgs-neovim { system = system; }).neovim-unwrapped;
		overlays = [
			(final: prev: { zellij = zellij.packages.${system}.default; })
			(final: prev: { atuin = inputs.atuin.packages.${system}.default; })
			(final: prev: { neovim-unwrapped = neovim-pkgs.neovim-unwrapped; })
			(final: prev: { vimPlugins = neovim-pkgs.vimPlugins; })
		];
	};
      in
      {
        packages.home-manager = inputs.home-manager.defaultPackage.${system};
        defaultPackage = self.packages.${system}.hello;
        devShell = pkgs.mkShell {
          packages = [
            pkgs.sops
            pkgs.age
          ];
        };

        # nix build .#homeManagerConfigurations.x86_64-linux.codespace.activationPackage && result/activate
        # nix run .#home-manager -- switch --flake ".#codespace"
        packages.homeConfigurations.codespace = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
	  # extraSpecialArgs = {neovimPackage = neovim; };
          modules = [
            ./home-manager/home.nix
            ./home-manager/codespaces.nix
          ];
        };

        # nix run .#home-manager -- switch --flake '.#mac'
        packages.homeConfigurations.mac = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
	  # extraSpecialArgs = {neovimPackage = neovim; };
          modules = [
            mac-app-util.homeManagerModules.default
            inputs.sops-nix.homeManagerModules.sops
            ./home-manager/home.nix
            ./home-manager/mac/mac.nix
          ];
        };

        packages.homeConfigurations.server = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
	  # extraSpecialArgs = {neovimPackage = neovim; };
          modules = [
            ./home-manager/home.nix
            ./home-manager/server.nix
          ];
        };

        packages.homeConfigurations.parallels = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
	  # extraSpecialArgs = {neovimPackage = neovim; };
          modules = [
            ./home-manager/home.nix
            ./home-manager/parallels.nix
          ];
        };
      });
}
