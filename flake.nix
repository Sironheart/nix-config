{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Darwin Inputs
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    devenv.url = "github:cachix/devenv/main";
    devenv.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";

    sironheart-nvim.url = "github:Sironheart/nvim-config";
    sironheart-nvim.flake = false;
  };

  outputs =
    inputs@{
      darwin
    , devenv
    , flake-parts
    , home-manager
    , nixpkgs
    , self
    , sops-nix
    , sironheart-nvim
    , ...
    }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
      extraArgs = {
        flake = self;
        inputs = inputs;
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = supportedSystems;

      flake = {

        colmena = {
          meta = {
            nixpkgs = import nixpkgs { system = "aarch64-linux"; };
            specialArgs = extraArgs;
          };

          "oracle-cloud" =
            { name
            , nodes
            , pkgs
            , ...
            }:
            {
              deployment = {
                tags = [ "oracle" ];
                buildOnTarget = true;
                targetHost = "141.147.6.79";
              };

              imports = [
                sops-nix.nixosModules.sops
                ./lib/oracle-cloud
              ];
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
              }
            ];
          };
        };

        nixosConfigurations = {
          "tower" = nixpkgs.lib.nixosSystem {
            specialArgs = extraArgs;
            modules = [
              ./lib/tower
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = extraArgs;
                home-manager.users.steffen = import ./lib/tower/home-manager.nix;
              }
            ];
          };
        };
      };

      perSystem = { pkgs, ... }: {
        formatter = pkgs.nixpkgs-fmt;

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ colmena just ];
          };
        };

        packages = {
          sironheart-nvim = pkgs.vimUtils.buildVimPlugin {
            name = "sironheart-nvim";
            src = sironheart-nvim;
          };
        };
      };
    };
}
