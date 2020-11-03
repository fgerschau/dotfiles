Install homebrew packages by running `brew bundle` in this directory.

Point to githooks in `.gitconfig`:

```
[core]
	hooksPath = ~/dotfiles/githooks
```

To swap capslock and escape on linux run the following:

`setxkbmap -option caps:swapescape`

## Coc Extensions

After installing all vim plugs (via `:PlugInstall`), remove the package.json file from the coc config:

```
rm .config/coc/extensions/package.json
```

Then create a link to the file from the dotfiles:

```
ln -s ~/dotfiles/coc/package.json ~/.config/coc/extensions/package.json
```

The go to `.config/coc/extensions` and run `yarn` to install the packages.
