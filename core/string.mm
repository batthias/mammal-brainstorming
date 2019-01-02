#!/usr/bin/env mammal -v aardvark
"""
String functionality

This includes the definition of string literals
"""


class <str>:
    """A very basic string class"""

    def __cast_int__(self):
        """Called via `<int> strobj`"""
        return self.parseAsInt()

    def parseAsInt(self, <int|None> base:=None):
        """Converts the string into an integer, if possible"""
        str := self.upper()  # only do uppercase
        negative := False
        number := 0
        digits := "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

        if str[0] = "+"
            str := str[1…]
        else if str[0] in "−-"
            negative := True
            str := str[1…]

        if base is None:  # determine which base is used automatically
            switch str[0…1]:
                "0x": base := 16
                "0o": base := 8
                "0b": base := 2
            finally:
                str := str[2…]
            else if "0" ≤ self[0] ≤ "9":
                base := 10
            else:
                raise <CastingImpossibleError>()
        digits = digits[0 … base-1]

        for i, d in str.enumerate():
            number += digits.indexOf(d) ⋅ base^i
        finally with est:
            if est instanceOf <loopIgnored>:  # never ran through
                raise <CastingImpossibleError>()

        return number
