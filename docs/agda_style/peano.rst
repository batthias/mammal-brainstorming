============
Hello, Peano
============

Blatently stolen from the `Learn You An Agda guide <http://learnyouanagda.liamoc.net/pages/peano.html>`_
**TODO:** Introductory chapter
**TODO:** Index file
**TODO:** combine with LYAH-documentation

Definitions, Definitions
========================

So, unlike the previous chapter, this chapter will actually involve some coding in *Mammal*.
We start by creating a ``tutorial`` folder and inside a ``peano.mm`` file.
First add the *module docstring*::
    #!mammal -v aardvark
    """`peano` module -- define the natural numbers yourself.

    A simple example module to get you started with *Mammal*.

    Author:  LYaMammal Tutorial
    """

This is an important part of every module file. One thing it makes sure is that every module knows
which *Mammal version* it depends on (the first line).
Also it can contains the modules name and maintainer-information.
*Note:* The compiler will complain if these are missing or nonsensical.

*Note for software developers:* This is often useful if the information is not retrievable from
your version control (e.g. because you switched to a new repository). There are even some git-hooks
available to keep this up to date automatically.


Most language tutorials start with the typical ``“Hello, World”`` example, but this is not really
appropriate for a first example in Mammal. Unlike other languages, which rely on a whole lot of
primitive operations and special cases for basic constructs, Mammal is very minimal — most of the
“language constructs” are actually defined in libraries.

Mammal does have numbers built into the *core libraries* (which are loaded by default),
but for the sake of learning we’re going to define them ourselves — specifically *natural numbers*.
Natural numbers are positive integers, that is, the whole numbers starting with zero and going up.
Mathematics uses the symbol ``ℕ`` to represent natural numbers, so we’re going to borrow that for
our example.
(Another thing that sets Mammal apart from other languages is its extensive use of unicode to make
mathematical constructs more natural and easier to read).
To enter ``ℕ`` into atom, type ``\bb N``. To enter the unicode arrow (``→``), type ``->``.
I’m going to demonstrate this line by line, so bear with me. ::
    ℕ := <set>

To begin, we type ``ℕ :=``. The ``:=`` *operator* means we’re defining something — in this case
the type, ``ℕ``. For this example, we’re specifying that this type, ``ℕ``, is a type of type
``<set>`` — that’s what the angle brackets (``<`` and ``>``) tell you.


Hold on a second, types have types?
-----------------------------------

If you recall the introduction, I mentioned that in Mammal, types and values are treated in pretty
much the same way. This means that, seeing as values are given types, types are given types as
well. Types are merely a special group of language terms (in general those denoted by angle brackets),
and in Mammal, all terms have types.

Even ``<set>`` (the type of our type ``ℕ``) has a type: ``<set₁>``, which has a type ``<set₂>``,
going on all the way up to infinity. We’ll touch more on what these *set types* mean later,
but for now you can think of ``<set>`` as the type we give to all the data types we use in
our program.

**Note:** This infinite hierarchy of types provides an elegant solution
to `Russell’s Paradox <http://en.wikipedia.org/wiki/Russell's_paradox>`_.
Seeing as for any ``ν ∈ ℕ``, ``<set> ν`` contains only values “smaller” than ``ν``,
(for example, ``<set₁>`` cannot contain ``<set₁>`` or ``<set₂>``, only ``<set>``),
Russell’s problematic set (which contains itself) cannot exist and is not admissable.

Structural Induction
--------------------

Okay, so, we’ve defined our type, but now we need to fill the type with values.
While a type with no values does have its uses, a natural numbers type with no values is
categorically wrong. So, the first natural number we’ll define is zero::
    ℕ := <set>
        zero: ℕ

Here we are simply declaring the term zero to be a member of our new type ``ℕ``.
We could continue to define more numbers this way::
        one: ℕ
        two: ℕ
        three: ℕ
        four: ℕ

But we’d quickly find our text editor full of definitions and we’d be no closer to defining all
the natural numbers than when we started. So, we should instead refer to a strict
mathematical definition. The notation I’m using here should be familiar to anyone who knows
set theory and/or first-order logic — don’t panic if you don’t know these things, we’ll be
developing models for similar things in Mammal later, so you will be able to pick it up as we go
along.

* Zero is a natural number (``0 ∈ ℕ``).
* For any natural number ``n``, ``n + 1`` is also a natural number. For convenience, We shall
  refer to ``n + 1`` as ``suc n``. (``∀ n ∈ ℕ: suc n ∈ ℕ``).

This is called an *inductive definition* of natural numbers. We call it *inductive* because it
consists of a base rule, where we define a fixed starting point, and an inductive rule that,
when applied to an element of the set, induces the next element of the set.
This is a very elegant way to define infinitely large sets. This way of defining natural numbers
was developed by a mathematician named Giuseppe Peano, and so they’re called the Peano numbers.

We will look at inductive *proof* in the coming chapters, which shares a similar structure.

For the base case, we’ve already defined zero to be in ``ℕ`` by saying::
    ℕ := <set>
        zero: ℕ

For the second point (the inductive rule), it gets a little more complicated. First let’s take
a look at the inductive rule definition in first order logic::
    ∀ n ∈ ℕ: suc n ∈ ℕ

This means, given a natural number ``n``, the constructor ``suc`` will return another
natural number. So, in other words, ``suc`` could be considered a function that, when given
a natural number, produces the next natural number. This means that we can define the
constructor ``suc`` like so::
    ℕ := <set>
        zero: ℕ
        suc: ℕ → ℕ

**TODO:** Here we see that mammal still needs some work.
We want to define a set which contains an element named ``zero``, which should probably be
accessible via ``ℕ.zero`` and a function ``suc`` which should be accessible via ``suc n``
for ``n`` in ``ℕ``. To define things I want to use the ``:=`` operator I think.


Now we can express the number one as ``suc zero``, and the number two as ``suc (suc zero)``,
and the number three as ``suc (suc (suc zero))``, and so on.

+-------------------------------------------------------------------------------------------------+
| *Note:** Incidentally, this definition of natural numbers corresponds to the                    |
| Haskell data type::                                                                             |
|   data Nat = Zero | Suc Nat                                                                     |
|                                                                                                 |
| If you load that into *GHCi* and ask it what the type of *Suc* is, it (unsurprisingly) will     |
| tell you: ``Nat -> Nat``. This is a good way to get an intuition for how to define constructors |
| in Mammal.                                                                                      |
|                                                                                                 |
| It’s worth noting that *Haskell* is still not dependently typed, so much of what you learn Here |
| won’t carry over directly to extended Haskell. It will mostly carry over to *Agda* though.      |
+-------------------------------------------------------------------------------------------------+


One, Two.. Five!
================

Now we’re going to define some arithmetic operations on our natural numbers.
Let’s try addition, first. ::
    `+` := (ℕ × ℕ) → ℕ

Here I’m declaring a function. To start with, I give it a type — it takes two natural numbers,
and returns a natural number.

**TODO:** explain operator signatures.
**TODO:** continue
