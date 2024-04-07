default:
    @just --list

build-linux tag:
    nix develop -c colmena apply --on {{ tag }}

build-mac:
    nix flake update sironheart-nvim; darwin-rebuild switch --flake $(pwd)

build-nixos:
    nixos-rebuild switch --flake '.#desktop'

format:
    nix fmt $(pwd)

edit-secret:
    nix-shell -p sops --run "SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt sops lib/oracle-cloud/secrets/default.yaml"
