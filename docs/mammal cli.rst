==============
The mammal CLI
==============

The mammal CLI can be used to call stuff.

Usage
-----

::
    mammal [<general options>] <command> [<args>]

These are common *mammal* commands used in various situations:

* ``mammal <filepath> [<args>]``
    Run a *mammal script* (only works if the filename ends in ``.mm``).
* ``mammal run <filepath|modulename> [<args>]``
    Run a *mammal script* or a module.
* ``mammal help [<topic>]``
    Show help for a certain topic (normally in a browser window)
* ``mammal version``
    Show what version is used and which are installed.
* ``mammal exec <code> [<args>]``
    Run some code in *mammal*.
* ``mammal shell``
    Open a *mammal shell* (REPL), where you can input functions.
* ``mammal fmt <filepath>``
    Format a *mammal* file / folder with files according to the style conventions.
* ``mammal build``
    Precompile a *mammal script*, so it can be run faster.
* ``mammal pkg``
    Use the [☞ package manager <packages.rst>] used for mammal.
* ``mammal completion``
    A helper command used for command completion.


General options
---------------

* ``-h``, ``-?``, ``--help``  Show general help. This is included for compatibility reasons.
                              Normally you should just use the more versatile ``help`` command.
* ``-v <version>``,
  ``--version=<version>``     Use a specific version of the *mammal kernel*. With ``<version>``
                              you can specify which
                              version of *mammal* to use, if there is more than one installed.
                              It can either be a number (e.g. ``1.2``) or a version name (e.g. ``aardvark``).
* ``-l <strategy>``,
  ``--logging=<strategy>``    Give less or more output. The logging strategy name can be specified.
                              Options allow for a more fine grained control of what is logged
                              and how.
* ``-c <config>``,
  ``--config=<config>``       Change some configuration options. Must be either the filename of a
                              config file (e.g. ``myconfig.yml``)  or a YAML style dictionary
                              (``{option1: value1, option2: value2}``) can be used.
* ``--no-color``              Suppress coloured output.


Settings
========

The settings are saved in a *YAML* file. See [☞ YAML Support <yml-support.rst>] for more information.
