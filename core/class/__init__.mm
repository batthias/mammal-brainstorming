#!/usr/bin/env mammal -v aardvark
""" Module defining how classes work

    Classes are pretty much just object factories.
    They use names of the form `<classname>` which allows you
    to use common expressions as class/typenames while avoiding
    conflicts with other names.

    Also includes the mysterious “type-language” used to define instances
    of what classes you want to allow as variables, parameters, etc.

    Version:  1st draft
"""

# Create the keywords necessary
__keywords__.add(
    `class` := <keyword>()
    `from` := <keyword>()


def <None> defineClass(classname, block, parents:=()):
    # Do something here in order to actually create a class
    pass

__operators__.add(
    "class {classname:x} from {parents}: {block:bx}",
    defineClass
)
__operators__.add(
    "class {classname:x}: {block:bx}",
    defineClass
)
