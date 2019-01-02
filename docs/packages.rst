========
Packages
========

All code resides in packages, which can be installed by some package manager
or manually.

The package manager *mammal-packages*
-------------------------------------

The default package manager which comes with mammal is *mammal-packages*.
It is a command line tool, but if you do not like to use a terminal you
can also use the GUI. Just call ``mammal-packages --gui`` — or go to the
Start-menu entry for *mammal-packages*.

Install a package:
``mammal-packages install somepackage``

Remove a package:
``mammal-packages uninstall somepackage``

List installed packages:
``mammal-packages list``

Search for packages online:
``mammal-packages search``

**Expert-Note:** Packages can be installed in a lot of places.
Under Windows they are normally installed on a per user basis and then reside
in ``%APPDATA%\Local\mammal\packages\``.
On Unix systems they are in ``~/.mammal/packages/``. You tend to not use
virtual environments since packages normally can define this stuff in their
``__setup__.mm``.

Package Layout
--------------
