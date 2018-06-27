#!/usr/bin/env python
#
# [SNIPPET_NAME: Create an Application Indicator]
# [SNIPPET_CATEGORIES: Application Indicator]
# [SNIPPET_DESCRIPTION: How to create an application indicator and add items to it]
# [SNIPPET_AUTHOR: Jono Bacon <jono@ubuntu.com>]
# [SNIPPET_DOCS: https://wiki.ubuntu.com/DesktopExperienceTeam/ApplicationIndicators]
# [SNIPPET_LICENSE: GPL]

import gi

gi.require_version('Gtk', '3.0')    # noqa
from gi.repository import Gtk as gtk

gi.require_version('AppIndicator3', '0.1')    # noqa
from gi.repository import AppIndicator3 as appindicator


class AppIndicatorExample:
    def __init__(self):
        self.ind = appindicator.Indicator.new(
            "example-simple-client", "indicator-messages",
            appindicator.IndicatorCategory.APPLICATION_STATUS)
        self.ind.set_status(appindicator.IndicatorStatus.ACTIVE)
        self.ind.set_attention_icon("indicator-messages-new")
        self.ind.set_icon("distributor-logo")

        # create a menu
        self.menu = gtk.Menu()

        # create items for the menu - labels, checkboxes, radio buttons and images are supported:

        item = gtk.MenuItem("Regular Menu Item")
        item.show()
        self.menu.append(item)

        check = gtk.CheckMenuItem("Check Menu Item")
        check.show()
        self.menu.append(check)

        radio = gtk.RadioMenuItem(None, "Radio Menu Item")
        radio.show()
        self.menu.append(radio)

        image = gtk.ImageMenuItem(gtk.STOCK_QUIT)
        image.connect("activate", self.quit)
        image.show()
        self.menu.append(image)

        self.menu.show()

        self.ind.set_menu(self.menu)

    def quit(self, widget, data=None):
        gtk.main_quit()


def main():
    gtk.main()
    return 0

if __name__ == "__main__":
    indicator = AppIndicatorExample()
    main()
