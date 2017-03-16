A set of configuration files as I like 'em
==========================================

Check this out into a ~/etc directory, with all its submodules::

    cd ~
    git clone --recursive git@github.com:dvarrazzo/dotfiles.git etc

Create symlinks to the config files::

    ./etc/makelinks.sh

Generate vim help for all the plugins::

    for d in $(find etc/vim -type d -name doc); do vim -c "helptags $d" -c q; done

Perfect.

Use the url ``https://github.com/dvarrazzo/dotfiles.git`` if you don't have
write permission, ``-b NAME`` to check out a different branch.


System requirements
-------------------

I'd rather have them local but I don't seem to find a way to make them work
correctly, so::

    # for syntastic check on python files
    sudo apt install python-flake8 python3-flake8

    # for syntastic check on js/react files
    sudo npm install -g eslint eslint-config-standard eslint-plugin-promise \
        eslint-plugin-react eslint-plugin-standard jsonlint
