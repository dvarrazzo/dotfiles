How To Unfuck Ubuntu
====================

Missing "default" session
-------------------------

The user defined session (a.k.a. ``~/.session`` is used to run the WM of your
choice together with other programs. In Ubuntu this is disable because some
moron thinks `it is confusing`__.

.. __: https://bugs.launchpad.net/ubuntu/+source/lightdm/+bug/818864

From the ``../xsession`` dir:

- copy ``xsession.desktop`` as ``/usr/share/xsessions``;
- symlink ``xsession`` as ``~/.xsession``

to have the choice of running i3 with the Gnome keyring or the Gnome
environment. Except that...


``gnome-session`` is no more
----------------------------

In 12.04 I could use ``gnome-session &`` in ``~/.xsession`` and it would have
run the entire desktop environment using Awesome as WM. This is no more
possible: if you try in 14.04 the desktop will steal your notifications (i.e.
no application icons).

So in 14.04 you get the shit appearence of the basic gtk2-or-whatever theme,
Windows-3.11-style. Welcome back to fucking 1993, and no Nirvana around either.

To check if the notification area is fucked run ``appind.py``.

You can restore some style using ``lxappearance``. For the functionalities
we'll see.


Keyboard fucked up in Ubuntu 14.04
----------------------------------

No en-uk keyboard, no alt-gr composite, ````` must be pressed twice...  WTF?
iBus?

Disable iBus by running ``gnome-language-selector`` (keyboard input method
system: none).


The fucking drums are back
--------------------------

I'm so happy. ::

    sudo mv -vi /usr/share/sounds/ubuntu/stereo/system-ready.ogg{,.fuckoff}


Upgrading to 18.04
------------------

Mostly smooth, but gksudo is gone. Managed to run pkexec by starting the auth
manager in i3 conf (without it doesnt't give permission, and reports me as a
naughty user, so I guess I won't have a gift for Christmas this year).

Somewhere is reported I seem to need to export some env bits, proposing this
alias::

    alias gksu='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'

But it doesn't seem necessary.
