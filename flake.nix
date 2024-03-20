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

    mac-app-util.url = "github:hraban/mac-app-util";

    sironheart-nvim.url = "github:Sironheart/nvim-config";
    sironheart-nvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ darwin
    , devenv
    , flake-parts
    , home-manager
    , nixpkgs
    , self
    , sops-nix
    , mac-app-util
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
                  mac-app-util.homeManagerModules.default
                ];
              }
            ];
          };
        };
      };

      perSystem = { pkgs, ... }: {
        formatter = pkgs.alejandra;

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ colmena just ];
          };
        };
      };
    };
}
