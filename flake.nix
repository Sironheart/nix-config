{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Darwin Inputs
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin-modules.url = "github:shyim/nix-darwin-modules";
    darwin-modules.inputs.nixpkgs.follows = "nixpkgs";

    nixd.url = "github:nix-community/nixd";
  };

  outputs = {
    nixpkgs,
    home-manager,
    self,
    ...
  }:
  let 
    supportedSystems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    extraArgs = {
      flake = self; 
    };
  in {
    colmena = {
      meta = {
        nixpkgs = import nixpkgs { system = "aarch64-linux"; };
      };

      "rpi-nix-01" = {
        name,
        nodes,
        pkgs,
        ...
      }: {
        deployment = {
          tags = [ "raspi" ];
          buildOnTarget = true;
          targetHost = "192.168.1.3";
        };

        imports = [
          ./systems/rpi-01
        ];
      };

      "rpi-nix-02" = {
        name,
        nodes,
        pkgs,
        ...
      }: {
        deployment = {
          tags = [ "raspi" ];
          buildOnTarget = true;
          targetHost = "192.168.1.4";
        };

        imports = [
          ./systems/rpi-02
        ];
      };

      "rpi-nix-03" = {
        name,
        nodes,
        pkgs,
        ...
      }: {
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
    
    formatter = forAllSystems (
        system:
        nixpkgs.legacyPackages.${system}.nixpkgs-fmt
      );
  };
}