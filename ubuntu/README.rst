How To Unfuck Ubuntu
====================

Missing "default" session
-------------------------

The user defined session (a.k.a. ``~/.session`` is used to run the WM of your
choice together with other programs. In Ubuntu this is disable because some
moron thinks `it is confusing`__.

.. __: https://bugs.launchpad.net/ubuntu/+source/lightdm/+bug/818864

You can:

 - ``sudo cp -vi ~/etc/xsession/xsession.desktop /usr/share/xsessions/``
 - ``ln -s ~/etc/xsession/xsession ~/.xsession``


to have the choice of running i3 with the Gnome keyring or the Gnome
environment. Except that...

---

2019-03-30: ran the gnome session, and "default" session stopped working. Had
to replace ``default`` with ``~/.xsession`` in the ``Exec`` entry of the
``.desktop`` file.


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

Qt programs may still look like Windows 95 (e.g. Clementine). For them you
need::

    [Qt]
    style=GTK+

in ``~/.config/Trolltech.conf``.


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

----

On the work desktop fonts look terrible. It seems a problem with libreetypes,
trying `this workaround`__.

.. __: https://github.com/adobe/brackets/issues/14290#issuecomment-394118945

No, cancel that, trying `this ppa`__ instead...

.. __: https://launchpad.net/~as-asaw/+archive/ubuntu/fonts

Broken meld display
-------------------

meld and other gtk programs have broken display. See `this bug`__ for more
details. Solution is to replace ``run_im xim`` with ``run_im none`` in the
``~/.xinputrc`` file.

.. __: https://gitlab.gnome.org/GNOME/meld/issues/186

Of course the input file breaks the display, no?


Bluetooth not working on the Lenovo
-----------------------------------

Bluetooth not working on makkuro (lenovo X1 carbon). "No bluetooth found" in
the settings panel.

Got in ``/var/log/messages``::

    Mar 23 10:51:07 makkuro kernel: [ 7179.272081] bluetooth hci0: Direct firmware load for brcm/BCM20702A1-0a5c-21e6.hcd failed with error -2
    ...
    Bluetooth: hci0: last event is not cmd complete (0x0f)

Followed__ some__ googling__. Got rid of the first message but not the second,
still not working.

.. __: https://forums.linuxmint.com/viewtopic.php?t=275433
.. __: https://plugable.com/2014/06/23/plugable-usb-bluetooth-adapter-solving-hfphsp-profile-issues-on-linux/
.. __: https://github.com/winterheart/broadcom-bt-firmware

----

Turns out bluetooth works alright (using command line or blueman); it's the
control panel that doesn't work. `Opened a bug`__.

.. __: https://bugs.launchpad.net/ubuntu/+source/gnome-control-center/+bug/1822439


Samba on Ubuntu 20.04
=====================

Samba 4.11 (on Ubuntu 20.04) has `disabled SMB1`__, which seems needed for the
nas.

.. __: https://www.samba.org/samba/history/samba-4.11.0.html

Added the following to ``/etc/samba/smb.conf`` to make it work::

   client min protocol = NT1

Later I discovered how to bump the smb version on the nas so this shouldn't be
needed anymore.


i3 on 20.04
===========

The xsession method doesn't seem to work very well. However the repos:

    git@github.com:i3-gnome/i3-gnome.git

does almost the right thing. Most of the stuff is already started (keyring,
bluetooth). Xrandr didn't start, but it can be added as an autostart script
(in ``gnome-session-properties``, which FYI, manages stuff in
``~/.config/autostart/``).

Note: you have to disable ibus with ``gnome-language-selector``, like in 2014!
Or you won't have UK keyboard, only US.


Broken style on 20.04
=====================

Style is broken in i3-gnome session. lxappearance settings don't seem to
apply. It seems that xsettingsd helps: trying to add it to the session.

Update in 22.04
---------------

lxappearance seems to work here.
