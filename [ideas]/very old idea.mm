######################################################################
# Musterprogramm
# Author:  Max Mustermann
# Project: Musterprojekt
# Year:    2015
# Website: musterproje.kt
# E-Mail:  max@musterma.nn
# 
# This program does something, which should be described here.
# The first comment with the name is actually part of the language
# specification! For sub-files of a bigger project „Project:“ is also
# required. The „box-lines” are not required of course.
######################################################################

# By standard the only (useful) 'command' that exists is
# `import {A} to {B}`.
# Commands are called using »command« where the parameters are 
# replaced in the syntax.
# So technically you can only do the following:

(import (irgendeinmodul) to (.))

# This will load the 'module' „irgendeinmodul“, i.e. evaluate the
# source file for it. This might be a source file or a (more or less)
# precompiled file. It cannot be completely compiled yet.
# The linefeed-character ends the command!

######################################################################
# What are allowed command-names?

(help (the_old_lady) over (the_street))
# has the name `help (who) over (what)` or in normal form:
# `help () over ()`

# Brackets are optional as the compiler just goes through from left
# to right. So if you have a line like the following:
# >>>  A B C D E \n
# the compiler will first put each part of the line in a list.
# Then it guesses the brackets.
# It looks whether `A (B) C (D) E` is defined as something:
#   YES:  All good, we are done.
#   NO:   Let us be less "greedy". And test other cases.
1.   A (B) C (D) E
2.   A (B) C (D (E))
3.   A (B (C) D (E))

# Alles andere muss man klammern.
# Importieren wir mal was:

import std.integers               # Importiert das Standard Integermodul
(integer `1`) plus (integer `2`)  # addiert integer 1 und integer 2

# Was sind die Befehle:
# `() plus ()` ist die Addition. Eine Mögliche definition wäre:
# (define `(A) plus (B)`:
#   mov eax, A
#   add eax, B
#   return eax
# )
# `integer (n)` ist das erstellen eines Integers aus einer dezimalen
# Code-Zeichenkette.
# (define `integer (n)`:
#   
# )



# So this is „1 + 2“ (and since you dont assign it to anything ...
# well you wont see anything, but it compiles.
# you might say that is pretty stupid to write it like this, but it 
# isn't. Thats what a computer will actually do. He will create
# numbers 1 and 2 and call an add function to add them together.
# But you sure won't want to write it this way, so let us introduce
# macros.

import std.macro to .
define_binary_operator "+" as  ((L) plus (R))       in .
define_binary_operator "=" as  (assign (R) to (L))  in .

# These all do the same:
a = 1+2
assign (1+2) to a
assign (1 plus 2) to a
assign ((integer 1) plus (integer 2)) to a
# A good syntax-highlighter will help to see, what are parameters and
# what are parts of the commands
# There are no inherent data types, no inherent operators and so on
# "+" is not a command, commands have the form [A-Za-z][A-Za-z_0-9]

# Commands have a qualified name.
#   module.submodule.name{}parts{}with{}parameters{}in_between
# For your convenience you can write stuff in the brackets. It
# doesn't really matter though.
# the current namespace is called "."; its parent is called ".."
# and no there is no "...", you will need the
# (get_namespace {} in {}) for this.
# relative paths are given like this:
#   .submodule."commandname"
