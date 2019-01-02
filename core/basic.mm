#!/usr/bin/env mammal --core=core.basic -v aardvark
""" Provide some much needed operators and functions, to provide the core
    functionality of the language.

    The definitions herein are kind of self-referential.
    For compiling some of those self-referential definitions will have
    to be resolved.
"""

import core.basic: *  #! selfreferential


# Quotes
# TODO: here syntax-highlighting doesn't work yet for " and ' inside backticks
`'`, `'` := <quote>("singlequoted_string")
`"`, `"` := <quote>("doublequoted_string")
`'''`, `'''` := <quote>("triplequoted_string")
`"""`, `"""` := <quote>("sextuplequoted_string")
@selfreferential
`\``, `\`` := <quote>("backquoted_expression")

# Brackets
`(`, `)` := <bracketed>("round_brackets")  #! selfreferential
`[`, `]` := <bracketed>("square_brackets")
`{`, `}` := <bracketed>("curly_brackets")
`<`, `>` := <bracketed>("class_brackets")

# Assignment operators
@selfreferential
`:=` := <operator>("assign")
`->` := `−>` := <operator>("mapsTo")

# Comparison operators
`is` := <operator>("is")
`=` := <operator>("equal")
`≈` := <operator>("approximatelyEqual")
`≠` := <operator>("notEqual")

`<` := <operator>("lower")
`≤` := <operator>("lowerEqual")
`≥` := <operator>("greaterEqual")
`>` := <operator>("greater")
`⊂` := <operator>("subset")
`⊃` := <operator>("superset")

# Arithmetic operators
`+` := <operator>("add")
`−` := `-` := <operator>("subtract")
`⋅` := <operator>("multiply")
`^` := <operator>("exponentiate")
`/` := <operator>("divide")

# Binary arithmetic operators
`&` := <operator>("ampersand")
`|` := <operator>("pipe")
`%` := <operator>("modulo")
`<<` := <operator>("leftShift")
`>>` := <operator>("rightShift")

# Message operators
`−−>` := `-->` := <operator>("send")
`<−−` := `<--` := <operator>("receive")

# Set operators
`∪` := <operator>("union")
`∩` := <operator>("intersect")
`in` := <operator>("in")

# Modifying Assignment Operators
`+=` := <operator>("addAssign")
`−=` := `-=` := <operator>("subtractAssign")
`⋅=` := <operator>("multiplyAssign")
`^=` := <operator>("exponentiateAssign")
`/=` := <operator>("divideAssign")
`&=` := <operator>("ampersandAssign")
`|=` := <operator>("pipeAssign")
`%=` := <operator>("moduloAssign")
`∪=` := <operator>("unionAssign")
`∩=` := <operator>("intersectAssign")

# Logical operators
`not` := <operator>("not")
`and` := <operator>("and")
`or` := <operator>("or")
`xor` := <operator>("xor")
