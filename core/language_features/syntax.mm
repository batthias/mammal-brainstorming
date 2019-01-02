#!/usr/bin/env mammal -v aardvark
"""
Classes used to define used to define parts of the syntax

Provides you with classes for all the fancy syntax constructs of mammal.
Do not import these classes directly into the namespace, since their names
are prone to collide with important base classes.
"""


class <stringLiteral>:
    """
    A string literal in some kind of quotes
    """

    # This would also be a possibility to assure correct options:
    # <option> := <str> ∩ {'raw', 'format'}
    # ..., <set(option)> options:={} ...

    def __init__(self, <str> value, <…> quotes, <…> options:={}):
        """
        Create a string literal

        Parameters:
            value  —  Value of the string
            <str|tuple[str,str]> quotes  —  the used (start & end) quotes
            <set['raw'|'format']> options — raw oder formatted
        """

        self.options := options
        self.value := value  # the value of the literal
