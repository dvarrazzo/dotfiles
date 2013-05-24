A set of configuration files as I like 'em
==========================================

Check this out into a ~/etc directory::

    cd ~
    git clone git@github.com:dvarrazzo/dotfiles.git etc

After cloning you should update the submodules::

    cd etc/
    git submodule init
    git submodule update
    cd vim/bundles/pyflakes-vim/
    git submodule init
    git submodule update

Create symlinks to the config files::

    cd ~
    ./etc/makelinks.sh

Perfect.
