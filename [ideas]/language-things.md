# The mammal language

The mammal language is able to get along with quite a limited number of “things” which make up the language.

## Names

Names are what *constants*, *variables*, *functions*, *procedures* (or more generally all *objects*)
can be assigned to.
Examples would be `a`, `b`, `blubb`, `π` or `sin` and `print!`.


## Objects

Everything is an object. Here are some which have no special language meening but might be interesting.

### Constants

This is normally what a non-changing name would be called, e.g. `π` should always stay `3.1415926…`.
You can force this behaviour via the `#! constant` compiler hint, so
```python
    π := 3  #! constant
```
would warn you if you tried to change the value of `π`.
Shadowing it in another scope is fine though.

### Functions

Those are objects which assign an object to a tuple of objects.
```python
    #! deterministic
    f := (a,b) -> a + b

    #! nondeterministic
    #! implicitlyUses(`c`)
    g := (a,b) -> a + b - c
```
This also demonstrates how functions can be deterministic (completely defined by their input) or nondeterministic.
In the nondeterministic example the variable c from the outside scope is used.


### Procedures

Procedures are functions with side effects.
They are identified by a `!` at the end of the function name (before the brackets).
You cannot call procedures inside functions since then those become side-effecty as well.

If you want a function to produce output for debugging use the logging functions which pretend not to be
side-effecty with their only effect being log-output.


## Literals

Pretty much names you cannot assign to. Examples are numbers — like `1`, `6000`, `1.4ᴇ-14`, `0xABCDEF`.
Strings like `'hello world'` or `"mööp"` are another example of literals.
What isn’t a real literal any more (although you cannot assign to it) is
`f"{milk} & {cookies} are great!"`.
This will be equivalent to `"{milk} & {cookies} are great!".format(variables=__scope__)`,
which returns something like `milk.__cast_str__() + " & " + cookies.__cast_str__() + " are great!"`.


## Operators

Operators glue stuff together and do things. Examples of such operators are binary operators like
`+`, `-`, `⋅` and `/`. Or keyword operators like `not`, `in` and `and`.

Also operators are statements like `if …:`, `else:` or `import …`.
Operators are used when their pattern is found in the code. They also have names, but you don't call them via those.


## Expressions

Whenever you combine several operators and objects you get an expression (e.g.: `1 + 5`)


## Statement

Whenever you combine operators and objects in such a way that they are not an expression they are a statement instead.


All of those things are objects!
"""

a := `a := \`a := 5\``  # a is now the assignment of a statement to a.
a.execute!()  # execute the statement. Now a is the assignment of 5 to a.
a.execute!()  # a is now 5.

print!('hello')  # One of the most used procedures. This one changes the output.
a := 5 !  # since there is a space that‘s just good old factorial.
