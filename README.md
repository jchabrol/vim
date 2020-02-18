# What's this ?
My .vim folder with every plugin I use and my own annotated .vimrc file


# Requirements
- GNU stow, to handily install dotfiles in your home folder

# Installation
- In your home folder, create a `dotfiles` or `.dotfiles` directory if you haven't created it already
- Clone this repo in your dotfiles directory
- Use GNU stow to make all required symlink:

```bash
~/dotfiles$ stow vim
```

Install Vundle:
```bash
$ cd <DOTFILES_DIRECTORY>/vim && git submodule init && git submodule update
```
- Launch `vim`, pass the error messages with `Enter` and type `:PluginInstall` and `Enter`.
- When finished, exit and compile [YouCompleteMe](https://github.com/Valloric/YouCompleteMe):

```bash
# Warning: this will only give you javascript/typescript support, for other options go to the YouCompleteMe repo for explanations

# Install C dependencies
$ sudo apt-get install build-essential cmake

# Install Python dependencies
$ sudo apt-get install python-dev python3-dev

$ cd ~/.vim/bundle/YouCompleteMe

# Install with javascript support
$ python3 ./install.py
```
# Credits

My vimrc is based on the fantastic vimrc configuration from:
https://github.com/StephaneTrebel/vim
