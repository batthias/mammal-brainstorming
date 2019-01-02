#!/usr/bin/env mammal -v aardvark
""" Supports importing things

    This is very self-referential since one cannot define any of this, without
    imports already being defined. Therefore the definitions here can only be
    checked to be correct.
"""

import .syntax: <commaSeparated>,


# defining the import operator
def <None> importOperator(<commaSeperated>, b)
    """
    What is imported from a package must be rather clever, since there are several namespaces:
    | Usage        | Description                            | Magic-Dict
    |--------------|----------------------------------------|-----------------
    | name         | a normal name                          | `__names__`
    | `keyword`    | a keyword (thus keywords)              | `__keywords__`
    | <class>      | a class                                | `__classes__`
    | "c"          | a character (must be 1 char)           | `__characters__`
    | "operator"   | an operator name (more than 1 char)¹   | `__operators__`
    | `@decorator` | a decorator                            | `__decorators__`
    |--------------|----------------------------------------|------------------

    (1) Operators with a name of only 1 character are not allowed (and probably not a good idea).
    """
