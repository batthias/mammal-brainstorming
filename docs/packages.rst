========
Packages
========

All code resides in packages, which can be installed by some package manager
or manually.

The Mammal Package Manager
==========================

To install, remove and list the mammal packages one uses a package manager.

The default package manager which comes with Mammal is a command line tool.
But if you do not like to use a terminal it also provides a GUI.
Just call ``mammal pkg --gui``.
On *Windows* you also find a link in the Start-menu for *Mammal*.

**Note:** The GUI is not always installed by default, as it would be useless
          on pure console systems like servers etc.

In the terminal the package manager is called via ``mammal pkg <command>``.

The following commands exist:
• ``install <packagename>`` Install a package.
• ``download``              Download packages.
• ``uninstall``             Uninstall/remove an installed package.
• ``list``                  List (main versions of) installed packages.
• ``show``                  Show information about installed packages.
• ``check``                 Verify installed packages have compatible dependencies.
• ``search``                Search the Package Index (online) for packages.
• ``freeze [<filename>]``   Create lockfile information for currently installed packages.
• ``hash``                  Compute hashes of package archives.
• ``config``                Manage local and global configuration.

**Expert-Note:** Packages can be installed in different locations.
Under Windows they are normally installed on a per user basis and then reside
in ``%APPDATA%\Local\mammal\packages\``.
On Unix systems they are in ``~/.mammal/packages/``. You tend to not use
virtual environments since packages can define their requirements in their
``config.yml``.


Package Layout
==============

**TODO:** More information about the package layout

[☞ previous: Installation <installation.rst>] ------- [☞ next:  <packages.rst>]
