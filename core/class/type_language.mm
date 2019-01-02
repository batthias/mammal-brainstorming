#!/usr/bin/env mammal -v aardvark
"""
# The type-language of mammal

The mysterious “type-language” used to define instances
of what classes you want to allow as variables, parameters, etc.

## The difference between types and classes
A type is a class, if and only if you can instanciate it.
E.g. `<int>` and `<str>` are classes, but `<int|str>` is “only” a type.

Version:  1st draft

```
    <A>  # Some defined class named `A`
    <+call>  # Some defined mixin-class (which also just is a class)
    <*> := <AllClass>  # All-Class
    <$> = <__class__>  # Class of wherever you are defining something
    <obj.$> = <obj.__class__>  # Class of some defined object `obj`
    <…>  # Definition is to be found in the `__docstr__` of the definer.

    <A|B> := <A> ∪ <B>  # both `<A>` and `<B>` are valid classes
    <A&B> := <A> ∩ <B>  # Needs to extend both `<A>` and `<B>`
    <A+callable> := <A> ∩ <+callable>  # Needs to extend `<A>` and the Mixin-class `<+callable>`

    <A&B|C> := (<A> ∩ <B>) ∪ <C>           # read: “A and B, or C”
    <A+call|C> := (<A> ∩ <+call>) ∪ <C>    # read: “A plus call, or C”
    <A & (+call|C)> := <A> ∩ (<+call> ∪ C) # read: “A and, plus-call or C”

    <A[squeek,3,'my']> := (o) -> <A>.__typecheck__(o, <squeek>, 3, 'my')
    <list^5> = <list⁵> := (o) -> <list>.__typecheck__(o, power:=5)
    <tuple[A]^3> = <tuple[A]³> = (o) -> <tuple>.__typecheck__(o, <A>, power:=3)
    <dict[('mouse':A)]> := (o) -> <dict>.__typecheck__(o, ('mouse', A))

    # Here a super complicated example:
    <set[
        A |
        dict[('a':A)|('b':B)|('c':C)|(int:E)]^(2…3)
    ]>
    # it allows sets, containing <A>s and/or dicts with 2 to 4 entrys with
    # the key-value combinations `'a': <A> obj`, ..., `<int> index: <E> obj`
```
"""

with __environments__['type'].__operators__ as ops:
    ops.add("*", () -> <AllClass>)  # All-Class shorthand
    # TODO: I don‘t think this works:
    ops.add("$", () -> <__scope__.parent.parent.__class__>)
    ops.add("{name:x}.$", (name) -> )
