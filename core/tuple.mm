#!/usr/bin/env mammal -v aardvark


class <tuple>:
    """
    The tuple, one of the fundamental “container structures”

    There are 4 major containers in mammal:
    `<tuple>`, `<dict>`, `<list>` and `<set>`

    The tuple allows keys — like `<dict>` (but they must be valid names).
    The tuple allows positional arguments — like `<list>`.

    I.e. tuples are kind of a combination of these two.
    """

    @classMethod
    def <…> __typecheck__(obj, <*> *args, <int> power=None):
        """
        Defines which kind of typechecks `<tuple>` supports

        Called whenever you have an expression like
        `<tuple[...]>` or `<tuple^4>`.

        Parameters:
            *args  —  The allowed elements of the tuple.
                      If only one is provided, the power is arbitrary, unless
                      explicitly provided.
                      If more than one is provided this fixes the power, i.e.
                      the number of elements. If you provide a differing
                      power an error will be thrown.
        Returns:
            <>  —

        """
        assert cls


    def __apply_rArrow__(self, tuple, block):
        """
        Lambda function-definition

        Normally written as `(a,b,c) -> do_something()`
        """
        assert tuple is self  # otherwise, weird stuff is happening
