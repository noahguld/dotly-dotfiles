# dotly dotfiles

Yet another work in progress dotfile manager

> Inspired by [holman/dotfiles](https://github.com/holman/dotfiles) and [pearl-core](https://github.com/pearl-core/pearl/)
> Dotly will be migrated to it's own repo, apart from my personal dotfiles, soon &trade;

## Install

```sh
git clone https://github.com/KarelCasier/dotly-dotfiles ~/.config/dotly
cd ~/.config/dotly
./bin/dotly install ~/.config/dotly/profile-mac
```

## About

> More info coming soon

A profile is simply a txt file listing modules to use. Installing a profile simply symlinks the text file to a `.current-profile` file which is then used in the rest of the installation process but also on shell startup. Any directory can be the base of user defined modules given that the profile file is at the root.

Each module contains a `install.sh` script and a corresponding `install` function that is called when installed using dotly (other functionality to come).

Optionally, each module can contain a `startup.sh/zsh` that is sourced on the corresponding shell's startup.

## Coming Soon

- Auto add dotly `startup.sh` sourcing to `.bashrc` and `.zshrc` if they exist
- Update module functions
- Uninstall module functions (called when switching to profiles that omit installed profiles)
- Quiet, Verbose and Force modes for commands

## Post install

- setup iTerm2 themes

- setup caps lock -> esc mapping (Unable find a `defaults write ...` command)

- install vim plugins using `:PlugInstall` in vim

- install tmux plugins using `<prexix-I>` in tmux
