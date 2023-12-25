default:
    @just --list

build-linux tag:
    nix develop -c colmena apply --on {{ tag }}

build-mac:
    darwin-rebuild switch --flake $(pwd)

format:
    nix fmt $(pwd)
