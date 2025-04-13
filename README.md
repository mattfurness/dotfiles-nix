### Home manager on macos:


Install nix

```
curl -L https://nixos.org/nix/install | sh
```

Source nix:

```
. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
```

Use experimental nix features:

```
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf
```

Initialise profile:

```
nix profile install nixpkgs#hello
```

Start a nix shell with a recent git:

```
nix-shell -p git
```

Clone the repo:

Note it is probably worth getting any ssh setup done at this point

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

Copy font files:

```
cp ~/Library/Fonts/nerd-fonts/* ~/Library/Fonts/
```

Update default shell:

```
echo "/Users/matt/.nix-profile/bin/bash" | sudo tee -a /etc/shells
chs -s /Users/matt/.nix-profile/bin/bash
```

Logout and in again so Allacrity pics up the base shell

Open Allacrity and run

```
base16_oceanicnext
```
