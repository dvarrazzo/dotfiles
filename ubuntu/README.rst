How To Unfuck Ubuntu
====================

Missing "default" session
-------------------------

The user defined session (a.k.a. ``~/.session`` is used to run the VM of your
choice together with other programs. In Ubuntu this is disable because some
moron thinks `it is confusing`__.

.. __: https://bugs.launchpad.net/ubuntu/+source/lightdm/+bug/818864

- Copy ``xsession.desktop`` as ``/usr/share/xsessions``
- Copy and ``xsession`` as ``~/.xsession``

to have the choice of running awesome with the gnome environment


Keyboard fucked up in Ubuntu 14.04
----------------------------------

No en-uk keyboard, no alt-gr composite, '`' must be pressed twice... WTF?
iBus?

Disable iBus by running ``gnome-language-selector`` (keyboard input method
system: none)


The fucking drums are back
--------------------------

I'm so happy. ::

    sudo mv /usr/share/sounds/ubuntu/stereo/system-ready.ogg{,.fuckoff}
