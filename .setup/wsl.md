# CSM WSL Setup Guide

_csmeron basic WSL environment setup_

This file is the "guide" for how I set up my WSL environment. I mostly use my
WSL env for programming/development as well as things I'd prefer to use Linux
for, because Windows is ugly, disgusting, and abhorrent.

This will cover how I set up things including but not limited to:

- Setting [ZSH](https://www.zsh.org) as default shell, possibly mentioning my
  preferred aliases
- Implementing [Oh-My-ZSH](https://ohmyz.sh) for plugins like autocomplete and
  syntax highlighting,
- Installing [Starship](https://starship.rs/) and applying my preferred [prompt](/.config/starship.toml),
- Setting up my [Neovim](https://github.com/neovim/neovim) config using my [dotfiles](/.config/nvim/),
- Connecting the github repo to properly sync changes.
- and maybe more!

_As of writing this, I'm using WSL-2 running Ubuntu 22.04.5 LTS, so keep that
in mind._
_Obviously, make sure to run your equivalent of `sudo apt update` and `sudo apt upgrade`
to ensure packages install properly._

---

## Initially

Don't forget to clone the repo:

```
# For me (SSH)
$ git clone git@github.com:csmeron/dotfiles.git ~/.dotfiles

# For others (HTTPs)
$ git clone https://github.com/csmeron/dotfiles.git ~/.dotfiles
```

This is the file that will contain all the configs to port over.

## Shell Configuration

### Installing ZSH

While I did for a while enjoy using Fish, I eventually moved back to zsh for
comfort. This setup uses Oh-My-ZSH to add a small amount of plugins to improve
functionality.

First and foremost, you need to actually install ZSH and set it as your default
shell:

```
# install zsh
$ sudo apt install zsh

# confirm install with `zsh --version`

# set it to default shell:
$ chsh -s $(which zsh)
```

After the install, you'll get a popup related to default config, choose `0`.

After a refresh of your shell/opening a new instance of WSL, ZSH should work.

### Setting up Oh-My-ZSH

The initial install of Oh-My-ZSH is super simple; all you need to do is run a
single command:

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

After doing this, you should see the OMZ splash screen, and a more appealing
prompt.

#### Installing plugins

Some of the plugins used in my OMZ config require installation beforehand.
Before copying the rc, run the following commands:

```
$ sudo apt install -y zsh-syntax-highlighting

$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

$ curl -sS https//starship.rs/install.sh | sh
```

Now, before we copy the .zshrc, you should copy the Starship config, as the
commands above installed Starship, and the zshrc sources it:

```
$ cp ~/.dotfiles/.config/starship.toml ~/.config/
```

Now copy the .zshrc to your home directory (using the appropriate dotfile path)
and source it to apply.

```
$ cp ~/.dotfiles/.zshrc ~/ && source ~/.zshrc
```

You should now see the custom prompt, as well as have suggestions and syntax
highlighting.

To view contents of the configs, see the [.zshrc](/.zshrc) and the [Starship config](/.config/starship.toml)

## Setting up Neovim

_Just like with my .zshrc and starship.toml, I already have a neovim config_
_created, we're just porting it over_

Firstly, we need to install a handful of packages to ensure plugins work properly:

```
$ sudo apt install -y python3-venv

$ sudo apt install -y unzip

$ sudo apt install -y luarocks

$ sudo apt install -y npm
```

Next, we need to actually install Neovim. This is a bit different than some
distros, as we need Neovim 0.10 or higher, so we need to add the unstable ppa
first, _then_ install.

```
$ sudo apt-add-repository ppa:neovim-ppa/unstable

$ sudo apt install -y neovim
```

Now, before opening the app, copy the config file over:

```
$ cp -r ~/.dotfiles/.config/nvim ~/.config/
```

Now for the actual setup.

When you initially run the `nvim` command, it'll pop up the Lazy menu, showing
(hopefully) all of the necessary plugins being downloaded. After everything
finishes, just `:q` out of nvim entirely, and re-enter it.

At this point, you'll be on the main screen, and you can run:

```
:MasonInstallAll
```

And, assuming the packages from earlier installed properly, you should see all
off the plugins installing. After this is done, you're good!

**_Note:_** _The leader key is **Space**. You can pull up a cheatsheet for_
_keybinds with `<leader>ch`._
