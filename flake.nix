{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Darwin Inputs
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    darwin-modules.url = "github:shyim/nix-darwin-modules";
    darwin-modules.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixd.url = "github:nix-community/nixd";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs =
    { nixpkgs
    , home-manager
    , darwin
    , darwin-modules
    , nixvim
    , sops-nix
    , self
    , ...
    }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      extraArgs = {
        flake = self;
      };
    in
    {
      colmena = {
        meta = {
          nixpkgs = import nixpkgs { system = "aarch64-linux"; };
          specialArgs = extraArgs;
        };

        "oracle-cloud" =
          { name
          , nodes
          , pkgs
#          , sops-nix
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
              ./systems/oracle-cloud
            ];
          };

        "rpi-nix-01" =
          { name
          , nodes
          , pkgs
          , ...
          }:
          {
            deployment = {
              tags = [ "raspi" ];
              buildOnTarget = true;
              targetHost = "192.168.1.3";
            };

            imports = [
              ./systems/rpi-01
            ];
          };

        "rpi-nix-02" =
          { name
          , nodes
          , pkgs
          , ...
          }:
          {
            deployment = {
              tags = [ "raspi" ];
              buildOnTarget = true;
              targetHost = "192.168.1.4";
            };

            imports = [
              ./systems/rpi-02
            ];
          };

        "rpi-nix-03" =
          { name
          , nodes
          , pkgs
          , ...
          }:
          {
            deployment = {
              tags = [ "raspi" ];
              buildOnTarget = true;
              targetHost = "192.168.1.5";
            };

            imports = [
              ./systems/rpi-03
            ];
          };
      };

      darwinConfigurations = {
        # Work Macbook
        "162534S0" = darwin.lib.darwinSystem {
          specialArgs = extraArgs;
          system = "aarch64-darwin";
          modules = [
            ./systems/mac-work
            darwin-modules.darwinModules.default
            home-manager.darwinModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = extraArgs;
              home-manager.users.steffenbeisenherz.imports = [
                ./home
                nixvim.homeManagerModules.nixvim
              ];
            }
          ];
        };
      };

      nixosConfigurations = {
        "tower" = nixpkgs.lib.nixosSystem {
          specialArgs = extraArgs;
          modules = [
            ./systems/tower
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = extraArgs;
              home-manager.users.steffen = import ./systems/tower/home-manager.nix;
            }
          ];
        };
      };

      formatter = forAllSystems (
        system:
        nixpkgs.legacyPackages.${system}.nixpkgs-fmt
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ colmena ];
          };
        }
      );
    };
}
