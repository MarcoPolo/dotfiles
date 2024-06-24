{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  inputs.home-manager.url = "github:nix-community/home-manager/release-24.05";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.sops-nix.url = "github:Mic92/sops-nix";


  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { system = system; };
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
          modules = [
            ./home-manager/home.nix
            ./home-manager/codespaces.nix
          ];
        };

        # nix run .#home-manager -- switch --flake '.#mac'
        packages.homeConfigurations.mac = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            inputs.sops-nix.homeManagerModules.sops
            ./home-manager/home.nix
            ./home-manager/mac/mac.nix
          ];
        };

        packages.homeConfigurations.server = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
            ./home-manager/server.nix
          ];
        };

        packages.homeConfigurations.parallels = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
            ./home-manager/parallels.nix
          ];
        };
      });
}
