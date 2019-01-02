#!/usr/bin/env mammal --language-feature -v aardvark
"""
Provides the `parseSignature` function
"""


def <…> parseSignature(<str> signature):
    r"""
    # Parse a string in the Signature-Mini-Language

    Parameters:
        `signature` — The signature to be parsed, which tries to keep to the
                      mammal-template language.
    Returns:
        ```
        <set[
            dict[('type':class) | ('name':str|int)] |
            str |
            class
        ]>
        ``` — Parsed syntax-series to look out for.

    In the signature `"{param}"` will mean parameters, which will be passed to
    the supplied function. Naming is optional, so `"{}"` will pass the
    parameter as the next one of the function/procedure.

    You can define how to transfer the
    given syntactic elements (default is by value):
        `"{par:n}"`:    The unevaluated name is reported — as if the whole
                        parameter was encapsulated with backticks.
        `"{par:b}"`:    The expression following is an (indented) code-block.

        `"({par})"`:    will require brackets around the parameter
        `"[{par}]"`:    will require square brackets around the parameter
        `"\{{par}}"`:   will require curly brackets around the parameter

    Supports the operator definitions defined below.
    • Binary operator (with spaces):
        `"{} < {}"` will be a binary operator comparing two objects.
        Spaces, tabs, or newlines will be required between operator and
        objects for the operator signature to match.
    • Binary operator (without spaces):
        `"{}+{}"` will be a binary operator adding two objects.
        No seperating chars are necessary and/or allowed. If you want to
        support all kinds of weird spacings you would also have to add
        `"{} + {}"`, `"{} +{}"`, and `"{}+ {}"` … but you shouldn‘t want this!
        Thus there is intentionally no shortcut for writing this.
    • Binary operator (with keyword):
        `"{} and {}"` will be a binary operator “anding” two objects.
        If `and` isn‘t a keyword yet, this will throw an error (unless you
        set `autoKeywords:=true`).
    • Binary operator (with keyword, but without spaces):
        `"{}ooo{}"` would allow you to use thinks like `(1,2)ooo(4)` and
        `[1,3]ooo(78)` but not much else; i.e. it‘s super weird and
        nobody in his right mind should use this!
        Thus it throws a `DoYouKnowWhatYouAreDoingWarning`.

    • Unary operator (in front of operand):
        "-{}" will add support for negative numbers. Again spaces are not
        supported automatically.
    • Unary operator (after the operand):
        "{}!" will add support to the wonderful factorial function as a
        concise operator.

    • Ternary operator (between operands):
        "{} < {} < {}" would allow you to do a kind of chained comparison.
        Ternary operators are checked before binary operators, so it would
        kind of work. Still this is not the way to go for comparisons.
        Have a look at `a < b < c < d`: The compiler would interpret this
        as `(a < b < c) < d`, which probably isn‘t what you want.
    • Ternary operator (the one peopele actually use):
        `"{} ? {} : {}"` could provide you with the operator you know and love.
        If you define it a `TheDevelopersWheepWarning` will be thrown ;)

    • Chaining binary operators:
        Some binary operators (like `<`, `≤`, `=`) are not meant to be
        bracketed in some way, i.e. you want `a < b ≤ c` to mean the same
        as `(a < b) and (b ≤ c)`.
        To allow this, create chaining-groups with `addChainGroup`.

    That‘s all I could think of at the moment. If you want to define something
    else, which isn't possible with those, tell me.

    Block statement operators:
        `"import {package:n}: {imports:bn}"` will allow you to use the import
        statement.
        Using `import sys: *Essentials, file_access as f` will be equivalent
        to using ```
          core.import._import(`sys`, `*Essentials, file_acces as f`)
        ```.
    """
    # Define what kind of objects are allowed before and after the operator.
    # E.g.: `+` doesn't require spaces before and after, leading to a
    # signature of the form `"{}+{}"`. One also needs to add `"{} + {}"`
    # where the spaces will mean 1 to many spaces or tabs
    #             or newlines.
    allowedBefore := ""
    allowedAfter := ""

    # TODO: make this thing return a reasonable object
    # e.g.: The signature "{} + {}" becomes
    return [
        {'type': <object>, 'name': 0},
        <whitespace>,
        '+',
        <whitespace>,
        {'type': <object>, 'name': 1},
    ]
