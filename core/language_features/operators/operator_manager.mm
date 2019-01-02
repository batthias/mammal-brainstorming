#!/usr/bin/env mammal --language-feature -v aardvark
"""
# Provides <operatorManager>

An instance of this manager is available as the magic variable `__operators__`
for the current scope. Creating more instances is probably not a good idea.
"""


import .signature_parser


class <operatorManager>:

    def __init__(self):
        pass

    def <operator> add(self, signature, definition):
        """Add a new operator
        Parameters:
            name       : name of the operator
            signature  : signature of the operator
            definition : function to be called
        Returns: the newly created operator
        """

    def parseSignature: signature_parser.parseSignature


    def registerForOverloading(self, <str> name, <proc> procedure)
        """Register an operator by name, so one can overload it"""




# Adds those to the current scope
with __operators__ as o:
    o.addChainGroup('and', ['equal', 'lower', 'lowerEqual'])        # a = b < c ≤ d
    o.addChainGroup('and', ['equal', 'greater', 'greaterEqual'])    # a = b > c ≥ d
    o.addChainGroup('and', ['equal', 'subset', 'subsetEqual'])      # A = B ⊂ C ⊆ D
    o.addChainGroup('and', ['equal', 'superset', 'supersetEqual'])  # A = B ⊃ C ⊇ D
    # As you can see an operator can be in multiple chain groups
