#!/usr/bin/env mammal -v aardvark --core=minimal
"""Provide the `<int>` class."""


#!checkConsistencyWithPreviousDefinition
<int> := <class>
    __new__: (class, <int> value) -> {value: value}  # only consists of this one value

    # Casting of other types

    __cast__: (class, <str> str) -> parseStringToNumber(str)  # parse to an integer

    #!overload
    __cast__: (class, <rational> value) ->
        if value.denominator = 1
            return {value: value.numerator}
        else
            throw ArgumentError('denominator must be 1 to be cast to integer', arg=`value`, problem=`value.denominator`)
