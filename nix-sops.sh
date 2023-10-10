#/usr/bin/env fish

nix-shell -p sops --run "SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt sops systems/oracle-cloud/secrets/default.yaml"
