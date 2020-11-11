### Home manager on macos:


Install nix

```
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
```

Source nix:

```
. ~/.nix-profile/etc/profile.d/nix.sh
```

Start a nix shell with git:

```
nix-shell -p git
```

Clone the repo:

```
git clone git@github.com:mattfurness/dotfiles-nix.git dotfiles
```

Enter the dotfiles nix-shell:

```
exit
cd dotfiles
nix-shell
```

Build home manager env:

```
home-manager switch
```
