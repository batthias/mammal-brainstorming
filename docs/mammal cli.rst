==============
The mammal CLI
==============

Usage
-----

::
    mammal [-v <version>] <command> [<args>]

With ``<version>`` you can specify which version of *mammal* to use,
if there is more than one installed.
These are common *mammal* commands used in various situations:

* ``mammal <filepath> [<args>]``
    Run a *mammal script* (only works if the filename ends in ``.mm``).
* ``mammal help [<topic>]``
    Show help for a certain topic (normally in a browser window)
* ``mammal version``
    Show what version is used and which are installed.
* ``mammal run <filepath|modulename> [<args>]``
    Run a *mammal script* or a module.
* ``mammal exec <code> [<args>]``
    Run some code in *mammal*.
* ``mammal shell``
    Open a *mammal shell* (REPL), where you can input functions.
* ``mammal fmt <filepath>``
    Format a *mammal* file / folder with files according to the style conventions.
* ``mammal build``
    Precompile a *mammal script*, so it can be run faster.
* ``mammal pkg``
    Use the package manager used for mammal.
* ``mammal completion``
    A helper command used for command completion.


General options
---------------

* ``-h``, ``--help``          Show general help. This is included for compatibility reasons.
                              Normally you should just use the more versatile ``help`` command.
* ``-v``, ``--verbose``       Give more output. Option is additive, and can be used up to 3 times.
* ``-q``, ``--quiet``         Give less output. Option is additive, and can be used up to 3 times
                              (corresponding to WARNING, ERROR, and CRITICAL logging levels).
* ``-c <config>``,
  ``--config=<config>``       Change some configuration options. Either a filename or a dictionary
                              (``{option1: value1, option2: value2}``) can be used.
* ``--no-color``              Suppress colored output.


Package Manager
===============

The *mammal package manager* is used to install packages.
It is called via ``mammal pkg <command>``.

The following commands exist:
* ``install``               Install packages.
* ``download``              Download packages.
* ``uninstall``             Uninstall/remove an installed package.
* ``list``                  List (main versions of) installed packages.
* ``freeze [<filename>]``   Create lockfile information for currently installed packages.
* ``show``                  Show information about installed packages.
* ``check``                 Verify installed packages have compatible dependencies.
* ``config``                Manage local and global configuration.
* ``search``                Search the Package Index for packages.
* ``hash``                  Compute hashes of package archives.


Settings
========

The settings are saved in a *YAML* file. See `settings.yml <file://settings.yml>`_ for an example.
