#!/usr/bin/env mammal -v aardvark

=================================================
Describe which naming conventions are to be used.
=================================================

You can specify different naming conventions in you ``settings.yml``.
This is especially okay if the names can be automatically converted from and to the default scheme
via ``mammal fmt``, allowing other developers to work on your code in their prefered naming scheme.

Tabs or spaces
==============

Our system uses spaces for indentation, since those look the same everywhere, no matter which
number of spaces represent a space. Tabs are then forbidden completely.
You can also always use spaces. Mixing them is not supported, since it is just horrible to
work with.

Numbers
=======

Write integers mostly without leading zeros, since those are often confusing.
You should use spaces to align numbers, if it increases readability of a list.

    numberOfSides := 16
    dontDoThis := [
        1256,
        0035,
        1028,
    ]
    butInsteadDoThis := [
        1256,
          35,
        1028,
    ]

If your number is normally printed with leading zeros you might want to include them though
— or you make those a string, which will allow spaces between the groups etc.

    creditCardNumber := 000124847184308

For long numbers you might also add underscores to group the digits:

    budget2017 := 12_184_147
    budget2018 :=  1_951_330

For small *rational numbers* don’t use spaces around the ``/`` operator. For long numbers
this might increase readability though.

    smallFraction := 1/3 + 7/9
    bigFraction := 123_533 / 238_013_283

For decimal representation you align at the ``.`` and normally use the same precision for
all numbers. This is assuming they are measured with the same precision, if not, keep the
precisions different.

    measurements := [
        0.15,
        1.00,
       16.04,
        5.33,
    ]

Scientific notation should preferebly use the ``ᴇ``-notation.

    sizes := {
        heliumAtom:  3.2ᴇ-11,
        eiffelTower: 3.24ᴇ2,
        earth:       1.49598023ᴇ10,
    }

You can use the optional ``+`` after the ``ᴇ`` if it makes sense in your situation.


Units
=====

If you want to use Units, those should mostly be written directly after the number.

    height := 210cm
    weight := 101kg
    age    :=  54a  # `a` is the official SI unit-symbol for years

Sometimes this decreases readability though, so you may want to use an underscore

    price := 17.89_EUR
    before the unit.

One important unit is ``i`` which is used for complex numbers.

    z1 := 15 + 6i
    z2 := -32i
    z3 := 0.9 + 1.2i

Be aware that ``i ≠ 1i`` since the first one refers to a variable named ``i`` while the
second references 1 of the unit ``i``. In circumstances where you extensively use complex
number you will want to define ``i := 1i`` to alleviate this problem.

Valid unit names can contain powers (e.g. ``m²``, ``s⁻¹``). This is still readable — especially
with good syntax highlighting. If you have units with multiplication or division in them you have
to write them as strings though.

    area := 16m²
    frequency := 120s⁻¹
    density := 127"g/cm³"
    weird := 33.33"m⋅kg"

Allowing units without string quotes is just syntactic sugar for the string literal version.

    13m² = 13"m²"


Variable names
==============

Variable names are normally *cammelCased*.

    lifeTheUniversAndEverything := 42
    myNiceValue := 1729
    numberOfOaks := 1000

Sometimes you want to use something like the math expressions with an index. Then an underscore
``_`` can be used for this name. This is especially usefull to distinguish casing.

    # mass of the electron
    m_electron := 9.109ᴇ-31kg

    # magnetization of the nail
    M_nail := 12.5"A/m"

It is also useful to seperate two cammel cased expressions into one variable name.

    helpFunction_frontendSystem := (topic) -> help('frontend: ' ∪ topic)


Container objects (sets, lists, dictionaries) may start with a capital letter.

    Fruit := ['apple', 'orange', 'papaya', 'mango']
    [a.titleCase() for a in A]



Function names
==============

Functions are named the same as variables, but generally are always start lowercase.

    cos := (x) -> Re e^(1i⋅x)
    sin := (x) -> Im e^(1i⋅x)

Type names
==========

Type names have to be written in angle brackets (``<someType>``). You don’t generally use
underscores or numbers in those names. They are mostly just written in latin characters.
But there may be reasons to make an exception from this rule.
Assume you want to create a *class* for α-limit-sets named ``<αLimitSet>``. This is of course
fine and in no way unreasonable.

    #!allowIllegalName
    <αLimitSet> := <class>
        # something
