# dotfiles

These are base versions of dotfiles.  To "install" them, clone this repo into
`~/.dotlinks`, then run `~/.dotlinks/install-dotlinks`

Those files that have the `.base` extension should somehow be sourced from your
existing dot files.  e.g., in your `.zshrc`:

```sh
source .zshrc.base
```

There are also scripts in `bin-shared` that will be linked to `~/bin/shared`, which 
will be referenced in your path by `.[zc]shrc.base`
