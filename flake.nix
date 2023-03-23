{
  description = "A very basic flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.home-manager.url = "github:nix-community/home-manager/release-22.11";

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { system = system; };
      in
      {
        packages.home-manager = inputs.home-manager;
        defaultPackage = self.packages.${system}.hello;
        devShell = pkgs.mkShell {
          buildInputs = [ pkgs.hello ];
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
