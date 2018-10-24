#!/usr/bin/env mammal -v aardvark --core=minimal
"""Provide the `<function>` class.

"""


#!checkConsistencyWithPreviousDefinition
<function> := <class>
    __new__: (<[]> signature, <codeBlock> body) ->
