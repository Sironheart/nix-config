default:
    @just --list

edit-secret:
    nix-shell -p sops --run "SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt sops lib/oracle-cloud/secrets/default.yaml"

format:
    nix fmt $(pwd)

local: _update-nvim-plugin _build-local

remote tag:
    nix develop -c colmena apply --on {{ tag }}

_update-nvim-plugin:
    nix flake update sironheart-nvim

[macos]
_build-local:
    darwin-rebuild switch --flake $(pwd) --fallback

[linux]
_build-local:
    sudo nixos-rebuild switch --flake '.#desktop' --impure
