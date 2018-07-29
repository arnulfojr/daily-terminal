# daily-terminal
This is my personal set up for tmux and vim. I tend to keep the default's key bindings, so is not only easier for you to reuse the configuration and adapt it to your key bindings of preference but I don't lose track of all the keys in the docs :)

## Brief introduction
This includes some dependencies managed by tpm and Vundle plugin managers for each of these components.

## Aware
So this is my configuration and this are my preferences you're free to take this as a base and extend or recommend different configurations, therefore this type of license attached in the repo.

## Dependencies
This set up is meant for macOS but works just fine with Linux Systems

* tmux-mem-cpu-load, I got it installed with homebrew, therefore is not set up as a tmux plugin dependency.
* tree, also installed via homebrew.
* tmux plugin manager: [tpm](https://github.com/tmux-plugins/tpm)
* [teamocil](https://github.com/remiprev/teamocil)
* Plugin Manager for vim: [Vundle](https://github.com/VundleVim/Vundle.vim)

# Usage

1. Clone the repository
2. For the Vundle and tpm installation please refer to their respective websites.
3. Rename the configuration files to match the configuration files to the respective sw.
    * i.E. from **vimrc** to **.vimrc**
4. Restart or reload the configuration files
5. Enjoy!

## Installing teamocil

Run `gem install teamocil && mkdir ~/.teamocil` then save all the configurations there.

For bash autocomplition add to `.bashrc` the following line `complete -W "$(teamocil --list)" teamocil`

# Contact

* Arnulfo Solis
* arnulfo.solis@moreandcoffee.com
* twitter: arnulfojr
