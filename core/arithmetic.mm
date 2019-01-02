#!/usr/bin/env mammal -v aardvark

# TODO: move this to the right place
#! decorator
def overloadableOperator(<+callable> func, <str> name):
    return (*args, **kwargs) ->
        for obj in args:
            if f`obj.__apply_{name}__`() in <+callable>:

        func(*args, **kwargs)

#! overloadableOperator("add")
def add(<*> a, <*> b):
    raise NotImplementedError(f"Neither {a}, nor {b} seem to implement `__apply_add__`.")

#! overloadableOperator("positive")
def positive(<*> a):
    raise NotImplementedError(f"{a} does not implement `__apply_positive__`.)

__operators__.!add("{} + {}", add)
__operators__.!add("{}+{}", add)
__operators__.!add("+{}", positive)
__operators__.!add("—{}", negative)
__operators__.!add("-{}", negative)
@overloadableOperator("")
