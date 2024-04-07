default:
    @just --list

edit-secret:
    nix-shell -p sops --run "SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt sops lib/oracle-cloud/secrets/default.yaml"

format:
    nix fmt $(pwd)

local: _build-local

remote tag:
    nix develop -c colmena apply --on {{ tag }}

[macos]
_build-local:
    nix flake update sironheart-nvim; darwin-rebuild switch --flake $(pwd) --fallback

[linux]
_build-local:
    nixos-rebuild switch --flake '.#desktop'
