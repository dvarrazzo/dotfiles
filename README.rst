A set of configuration files as I like 'em
==========================================

Check this out into a ~/etc directory, with all its submodules::

    cd ~
    git clone --recursive git@github.com:dvarrazzo/dotfiles.git etc

Create symlinks to the config files::

    ./etc/makelinks.sh

Generate vim help for all the plugins::

    for d in $(ls -d  */doc/); do vim -c "helptags $d" -c q; done

Perfect.

Use the url ``https://github.com/dvarrazzo/dotfiles.git`` if you don't have
write permission, ``-b NAME`` to check out a different branch.
