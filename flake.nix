{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    darwin,
    flake-parts,
    home-manager,
    nixpkgs,
    self,
    sops-nix,
    ...
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    extraArgs = {
      flake = self;
      inputs = inputs;
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = supportedSystems;

      flake = {
        colmena = {
          meta = {
            nixpkgs = import nixpkgs {system = "aarch64-linux";};
            specialArgs = extraArgs;
          };

          "oracle-cloud" = {
            name,
            nodes,
            pkgs,
            ...
          }: {
            deployment = {
              tags = ["oracle"];
              buildOnTarget = true;
              targetHost = "141.147.6.79";
            };

            imports = [
              sops-nix.nixosModules.sops
              ./lib/oracle-cloud
            ];
          };
        };

        homeConfigurations = {
          "desktop" = home-manager.lib.homeManagerConfiguration {
            modules = [./home ./lib/home-manager];
            pkgs = nixpkgs.legacyPackages."x86_64-linux";
            extraSpecialArgs = extraArgs;
          };
        };

        darwinConfigurations = {
          # Work Macbook
          "162534S0" = darwin.lib.darwinSystem {
            specialArgs = extraArgs;
            system = "aarch64-darwin";
            modules = [
              ./lib/mac-work
              home-manager.darwinModules.default
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = extraArgs;
                home-manager.users.steffenbeisenherz.imports = [
                  ./home
                ];
                ids.gids.nixbld = 30000;
              }
            ];
          };
        };
      };

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [colmena just];
          };
        };
      };
    };
}
