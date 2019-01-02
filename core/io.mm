#!/usr/bin/share mammal -v aardvark
""" Input-Output functions
"""

import .mammal_core: stdout, stderr, stdin

#! sideeffect('output')
def print(*messages, <+send|null> out=null):
    out = out? or stdout
    assert  is <#send>

    for message in messages:
        out.send(message)

#! waiting('input')
def <str> input(<+await|null> input=null):
    input = input? or stdin
    assert

    stdin.await('return')
    return stdin.lastLine()
