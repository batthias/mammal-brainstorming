#!/usr/bin/env mammal -v aardvark


class <locationNumeral>:
    <_self> = <locationNumeral>  # save some writing

    def __init__(self, stringRepr=""):
        self.str = stringRepr

    def abbreviate(self):
        self.str = str

    def __apply_add__(self, <_self|int|str> num1, <_self|int|str> num2):
        for num in [`num1`, `num2`]:
            if num.value instanceOf <int>:    num.value = <_self>(num.value)
            if num.value instanceOf <_self>:  num.value = num.value.str
        return (num1 + num2)

    def __cast_str__(self):
        return self.str
