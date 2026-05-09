hostname := `hostname`
user := `whoami`

gc:
    sudo nix-collect-garbage --delete-older-than 1d
    nix-collect-garbage --delete-older-than 7d

clean:
    rm -rf ./result
    rm -f *.qcow2

hm:
    home-manager switch -b backup --flake ./#{{user}} --show-trace

os:
    sudo nixos-rebuild switch --flake ./#{{hostname}}

os_rollback:
    sudo nixos-rebuild switch --flake --rollback

vm host:
    sudo nixos-build build-vm --flake .#{{host}} --show-trace
