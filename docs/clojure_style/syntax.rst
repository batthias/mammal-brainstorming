=====================
Learn Mammal - Syntax
=====================

Concept and some of the text blatanly stolen from the
`Clojure Guide <https://clojure.org/guides/getting_started>`_.

Literals
========

Below are some examples of literal representations of common primitives in *Mammal*.

The ``# `` (note the space after the hash sign) creates a comment to the end of the line.
::
    # Numeric types
    42              # Integer
    6.022ᴇ23        # Integer
    1.025           # Decimal faction
    22/7            # also a fraction

    # Character types
    "hello"         # String
    \e              # Character

    # Other types
    None            # null value
    True            # Boolean
    False           # also a boolean
    <re> "[0-9]+"   # Regular expression
    alpha:          # Keyword
    release.alpha:  # Keyword with namespace
    map             # Symbol
    +               # Symbol - most punctuation allowed
    core.``+``      # Namespaced symbol

All of the literals above are valid *Mammal* expressions.

*Mammal* also includes literal syntax for four collection types::
    [1, 2, 3]       # list
    (1, 2, c: 3)    # list with one named entry
    [11,12;21,22]   # matrix
    {1, 2, 3}       # set
    {a: 1, b: 2}    # map

We’ll talk about these in much greater detail later — for now it’s enough
to know that these four data structures can be used to create composite data.


Evaluation
==========

Next we will consider how *Mammal* reads and evaluates expressions.

Traditional Evaluation (Java)
-----------------------------

::
    ┌────────┐                                /\/\/\/\
    │ Source │                               < Effect >
    │  Code  │  ╲ characters                  \/\/\/\/
    └────────┘   ╲                               🡑
                  ↘   __________    bytecode   _____
                     ( Compiler )  ─────────> ( JVM )
                      ‾‾‾‾‾‾‾‾‾‾               ‾‾‾‾‾

In *Java*, source code (``.java`` files) are read as characters by the compiler (``javac``),
which produces bytecode (``.class`` files) which can be loaded by the *JVM*.

Clojure Evaluation
------------------

::
    ┌────────┐
    │ Source │
    │  Code  │  ╲  characters
    └────────┘   ╲
                  ↘   ________                        /\/\/\/\
                     ( Reader )                      < Effect >
                      ‾‾‾‾‾‾‾‾                        \/\/\/\/
                 ⭜        \  data structures             🡑
      👤💻 You             ↘  __________    bytecode   _____
                              ( Compiler )  ─────────> ( JVM )
                               ‾‾‾‾‾‾‾‾‾‾               ‾‾‾‾‾



In *Clojure* (which is one of the languages which influenced *Mammal*), source code is read as
characters by the *Reader*. The Reader may read the source either from ``.clj`` files or be given
a series of expressions interactively. The Reader produces *Clojure data*. The *Clojure compiler*
then produces the bytecode for the *JVM.*

There are two important points here:

1. The unit of source code is a Clojure expression, not a Clojure source file.
   Source files are read as a series of expressions, just as if you typed those
   expressions interactively at the REPL.
2. Separating the Reader and the Compiler is a key separation that makes room
   for macros. Macros are special functions that take code (as data), and emit
   code (as data). Can you see where a loop for macro expansion could be
   inserted in the evaluation model?


Mammal Evaluation
-----------------
::
    ┌────────┐
    │ Source │
    │  Code  │  ╲  characters
    └────────┘   ╲
                  ↘   ________                                /\/\/\/\     ┌─────────┐
                     ( Reader )                              < Effect >    │ Results │
                      ‾‾‾‾‾‾‾‾                                \/\/\/\/     └─────────┘
                 ⭜        \  AST                                 🡑       ↗
      👤💻 You             ↘  ______________    bytecode   ______________
                              ( JIT-Compiler )  ─────────> ( Processor(s) )
                               ‾‾‾‾‾‾‾‾‾‾‾‾‾‾               ‾‾‾‾‾‾‾‾‾‾‾‾‾‾
In *Mammal* the source code is also read as characters by a *Reader*. The input is read
from ``.mm`` files or is given interactively (for example via a *jupyter notebook*). The Reader produces an
*Abstract Syntax Tree* which can be optimzed and turned into a bytecode which can be evaluated by
some processors. The JVM would technically also be a reasonable target architecture, but normally direct
processor commands are faster.

There are a few points to note here:

1. A source file will be fully parsed and checked for consistency before executing anything.
2. The optimization migth actually make it possible for macro like structures to be compiled.
3. There is a distincitons betweeen *Effects* and *Results* of a program.
4. Parallel processing (on multiple CPUs, GPUs or even different computers) is supported at the
   JIT-Compiler step.

Structure vs Semantics
----------------------

Consider a *Mammal* expression::
    Number  Symbol  Number
           ↘   ↓   ↙    bracketed
    ⮣      (3 + 4)    ⮠
  Invoke   ↗   ↑  ↖
   Argument Function Argument

This diagram illustrates the difference between syntax above (the syntax tokens produced by the Reader)
and semantics below (how that data is represented in the AST at runtime).

Most literal *Mammal* forms ar evaluate to themselves, except symbols and lists.
Symbols are used to refer to something else and when evaluated, return what they refer to.
A bracketed expression (as in the diagram) is just for grouping and is evaluated as invocation.

In the diagram, ``(3 + 4)`` is read as a bracketed expression containing three tokens.
The number ``3``, the symbol ``+`` and the number ``3``. ``+`` has the signature ``{a} + {b}``
registered (we will explain operator signatures in more detail later) so *Mammal* knows that it should call the
function ```+``` (aka. ``add``) with ``3`` and ``4`` as arguments.

Many languages have both statements and expressions, where statements have some stateful effect but do not
return a value. In *Mammal*, everything is an expression that evaluates to a value.
Some expressions (but not most) also return *side effects*. But do not worry about those yet. If you want
side effects (which are quite useful sometimes) you have to use the keyword ``do``, so you always know which
functions produce them.

Now let’s consider how we can interactively evaluate expressions in *Mammal*.

Delaying evaluation with quoting
--------------------------------

**TODO:** mammal is kind of lazy, so this doesn’t make much sense without that explanation.

Sometimes it’s useful to influence when an expression is evaluated. You might want to suspend
evaluation to later time. Sometimes a symbol should just be a symbol without looking up what it refers to::
    >>> `x`
    x

And sometimes a list should just be a list of data values (not code to evaluate):

    >>> `(1, 2, 3)`
    (1, 2, 3)


REPL
====

M
