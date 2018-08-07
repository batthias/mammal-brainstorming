Some sample types
=================

========================  ==============================================================================
  Type expression            Description
========================  ==============================================================================
``<float>``               Floating point number
``<str>``                 character string
``<natural>``             natural number (ℕ = 1, 2, 3, …)
``<int>``                 integer (ℤ = 0, -1, 1, -2, 2, …)
``<rational>``            rational number (ℚ = 0, 1, -1, ½, -½, …)
``<real>``                real number (ℝ)
``<complex>``             complex number (ℂ)

``<list>``, ``<[*]>``     any list
``<set>``, ``<{*}>``      any set
``<dict>``, ``<{*:*}>``   any dictionary
``<odict>``               ordered dictionary (supports two kinds of indexing)
``<multiset>``            a multiset which can contain elements multiple times

``<+call>``               callable
``<+iter>``               iterable
``<+index>``              indexable
``<+add>``                addable
``<+mul>``                multiplicable

``<list(int)>``           list of integers
``<[int]>``               shorthand
``<list(str,int)>``       list with two elements, first a string, then an integer
``<[str,int]>``           shorthand (and so on, you get the jist)
``<[2…3 str]>``           string list with two or three elements
``<{int}>``               set of integers
``<{4 str}>``             set of four strings
``<{int|float}>``         set containing integers and floats
``<{str:int}>``           dictionary mapping strings to integers
``<{str:*}>``             dictionary mapping strings to anything
``<{str:[int]}>``         dictionary mapping strings to lists of integers
``<int→int>``             function mapping one integer to another one
``<(int,float)→str>``     function mapping an integer and a float to a string
``<str+call>``            a callable string (i.e. something inheriting from str that implements
                          the call-interface)
``<a&b>``                 something being both a member of class `a` and `b`
``<a+b>``                 something being both a member of class `a` and implementing interface `+b`
========================  ==============================================================================


Indexing
--------

Indexing via numbers allows you to access stuff.
The character ``$`` can be used to specify the length of the indexed object.

Let ``a`` be a list (or something else that is indexed).

================  ================================================================================
 Expression         Description
================  ================================================================================
``a[1]``          first element
``a[5]``          fifth element
``a[$]``          last element
``a[$-1]``        second to last element
``a[$/2]``        element in the middle (assuming even length)

``a[1…2]``        first two elements
``a[1…1]``        first one elements
``a[1…$-1]``      all but the last element
``a[…$-2]``       all but the last two elements
================  ================================================================================


Let ``B`` be a matrix (so it is two dimensional).

================  ================================================================================
 Expression         Description
================  ================================================================================
``B[1;1]``        top left element
``B[(1,1)]``      the same element as above

``B[$;$]``        bottom right element
``B[2;…]``        second row of the matrix
``B[…;2]``        second column of the matrix
``B[1,3;…]``      rows 1 and 3 of the matrix
``B[…2,4…;…]``    strike out the third row

1…3 ∪

================  ================================================================================

The indexing of a two-dimensional structure is different from a
one-dimensional one which contains other one-dimensional elements.
E.g. if you define
``A := [[1,2], [3,4]]`` and
``B := [1,2; 3,4]`` you would access ``B`` via ``B[1;2]``, while accessing elements
of ``A`` via ``A[1][2]``.


Let ``d`` be some mapping (like a dictionary).

================  ================================================================================
 Expression         Description
================  ================================================================================
``d{1}``          element with key ``1``  (integer key)
``d{"1"}``        element with key ``"1"`` (string key)
``d{(1,2)}``      element with key ``[1,2]`` (key is a list)

``d{"a","b"}``    elements with keys ``"a"`` and ``"b"``
``d{"a"…"b"}``    all elements between “a” and “b” (works only if ``d`` is ordered)
================  ================================================================================
