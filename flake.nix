{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";

    sironheart-nvim.url = "github:Sironheart/nvim-config";
    sironheart-nvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs @ { darwin
    , flake-parts
    , home-manager
    , hyprland
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
            }: {
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

        nixosConfigurations = {
          "desktop" = nixpkgs.lib.nixosSystem {
            specialArgs = extraArgs;
            system = "aarch64-linux";
            modules = [
              ./lib/desktop
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = extraArgs;
                home-manager.users.steffen.imports = [
                  # hyprland.homeManagerModules.default
                  ./home
                ];
              }
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
