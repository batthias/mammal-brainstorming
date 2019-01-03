=========
Functions
=========

**TODO:** Update once the syntax is clear(er)

To create a function you can use the function type:
    >>> func := <function> :: [`<int> x`, `<real> y: 2`],


Let us create a function

    >>> f := (<int> x) -> <int> : 2⋅x³ - x + 1

The function will only support *integer* inputs.
So if we try to use it with a rational number this won’t work:
    >>> try f(1/2)
    >>> catch TypeError
    >>>     do print "`f` only supports integers"
    `f` only supports integers

**Note:** Normally writing ``f(1/2)`` anywhere will raise an error at compile time.
          *mammal* tries to raise errors as early as possible. You can however
          put it directly in a *try-catch-block* which then delays the error to later.

So let us go all out and extend this function not just to rational or real, but
immediately to complex numbers.

    >>> #!extendFunction
    >>> f := (<complex> x) -> <complex> : f.callDuckTyped(x)

``<function>.callDuckTyped`` allows you to use a function with a “wrong” type.
The types of the signature are not checked, but rather it has a look whether maybe the
function also works with the input provided. If it does, all is well, otherwise an
error will be issued.

Now we can use ``f`` with one half too

    >>> f(0.5)
    0.75

So what happened to ``f`` here? It clearly is a different function.

    >>> do print f.__code__
    (<int|complex> x) -> <int|complex>
        extended_function := (<int> x) -> <int> (2⋅x³ - x + 1)
        if x in <int>
            return extended_function(x)
        elif x in <complex>
            return extended_function.callDuckTyped(x)
        else
            do ArgumentTypeError(`x`)

**Note:** The ``ArgumentTypeError`` can be called without a second argument specifying the
          allowed types here, since it can take them from the function signature.


This way of writing this seems kind of silly since $ℂ$ contains $ℤ$ and also we don't
need duck typing. So let us try to simplify:

<theorem> <function> (``<int> x``) ::




Let us create another function

    >>> g := (x) -> x³ + 2⋅x² - 1/3⋅x

This function will support any input that can be cubed, squared and
multiplied with rational numbers and afterwards added together.
So this would include ``<int>``, ``<rational>``, ``reel``, ``complex``,
square matrices and probably many more.

    >>> g(5)
    520/3
    >>> g(30/7)
    39119/343
    >>> g(2 + 3i)
    -170/3 + 32i
    >>> g([1,2; 3,4])
    [ 152/3, 220/3;
      110,   482/3 ]
