#!/usr/bin/env mammal -v aardvark
""" Allows you to create theorems, proofs and tests """

# The theorem operator
def theorem_(name, statements):


__operators__.add("theorem {name}: {statements}", theorem_, initializes:='theorem')


# Assign it to expressions


theorem "Prime Number Theorem":
    """ There is an infinate number of primes. """
