#!/usr/bin/env mammal -v aardvark
r"""
Environments, the way to not use the exact same syntax everywhere

In some cases you will want to use a different syntax for parts of the code.
If this seems complicated to you, here are some examples, to show you that
you do this all the time in most languages:
    `"code"`     —  The (mostly used) environment for most operations.

    `"type"`     —  The type language is quite different in order to keep
                    definitions of types short and (somewhat) readable.

    `"comment"`  —  Comments normally don’t have any syntax at all. So the part
                    `# I‘m doing something here` will just be ignored

    `"string"`   —  In a string you will give special meaning to some sequences
                    like `\(alpha)`, but everything else is just pure data.

    `"annotation" — Annotations allow you to tell the compiler something.
                    Admittedly it is pretty much still just code with a
                    different namespace.`
"""


class <environmentManager>:
    """
    Manages the environments

    The list of environments is global, because otherwise everything becomes
    super complicated.

    Some properties depend on the scope though. E.g. which names, keywords and
    operators are available.
