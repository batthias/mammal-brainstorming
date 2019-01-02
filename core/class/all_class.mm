#!/usr/bin/env mammal -v aardvark
""" Defines the AllClass, which contains absolutely everything """


class <AllClass> from <class>:
    """
    Contains everything
    """

    def __apply_union__(self, A, B):      # <A> ∪ <*> = <*> for all A
        return self

    def __apply_intersect__(self, A, B):  # <A> ∩ <*> = <A> for all A
        if A is self: return B
        return A

    def __apply_subset__(self, A, B):
        if A is B: return false           # <*> ⊂ <*>  is false
        if A is self: return False        # <*> ⊂ <A>  is true for all A
        return True                       # <B> ⊂ <*>  is true for all B

    def __apply_superset__(self, A, B):
        if A is B is self: return false   # <*> ⊃ <*>  is false
        if A is self: return True         # <*> ⊃ <A>  is true for all A
        return False                      # <B> ⊃ <*>  is false for all B

    def __apply_equal__(self, A, B):
        if A is B is self: return true    # <*> is a singleton
        return False
