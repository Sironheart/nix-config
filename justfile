default:
    @just --list

build-linux tag:
    nix develop -c colmena apply --on {{ tag }}

build-mac:
    darwin-rebuild switch --flake $(pwd)

format:
    nix fmt $(pwd)

edit-secret:
    nix-shell -p sops --run "SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt sops lib/oracle-cloud/secrets/default.yaml"
