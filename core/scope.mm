#!/usr/bin/env mammal -v aardvark
"""
Handling of scopes
"""


class <scope>:
    def __init__(self):


    def <str> path(self):
        return 'yourpackage.classyouarein.functionyouarein'

    def __getItem__(self, <i> index):
        find a name in the scope

getting the scope



#! definesMagicName
defMagicName __scope__: <scope>()






# Export the stuff we need exposed for the core
EXPORTS := <syntax>.makeDict(
    `__scope__`, ``
)
