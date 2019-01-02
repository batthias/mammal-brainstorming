# Some nice operators to be used

## Matrices

```python
    A = <matrix> [  # Matrix with 2d entries
        [4,8,1],
        [9,7,6],
        [2,5,3],
    ]

    print(A + A == 2 ⋅ A)  # Addition & multiplication with scalars

    if A.isInvertible
        print(A⁻¹ == A.inverse == A ^ (-1))  # The inverse of A
    else
        print( A.eigenvectors(eigenvalue=0) )  # Eigenvectors for the eigenvalue 0
```

## Special Matrices

```python
    B = <blockDiagonalMatrix> [A, A]

    # support for creation from strings, is sometimes useful
    print(B == <matrix>.fromFormat("""
        4 8 1      
        9 7 6   0  
        2 5 3      
              4 8 1
          0   9 7 6
              2 5 3
    """))  # writing the zeros is not really necessary

    C = <diagonalMatrix> [1,2,3,4,5,6]
    print(B + C)  # this is fine
    print(B ⋅ C)  # this is fine
    print(B * C)  # Error: Scalar product operator "*" is defined for vectors, did you mean multiplication "⋅"
    print(B / C)  # Error: Division not defined for matrices. Instead of "A / B" use "A ⋅ B­⁻¹"
```

## Sets

```python
    M = {2, 1, 4, 7, 6}  # Set with standard syntax
    L = <set> (5, 3, 8)  # Create a set from a tuple
    print(M ∪ L == <set>(1.8))  # don't even try to read this without good syntax highlighting
    print(M ∩ L == ∅)  # Singleton Object for the empty set
    print({1, 2} ⊂ M)  # Is contained in

    ML = {M, L}  # Set of sets with M and L contained (with \mathcal{M})
```

## Vectors (Tuples)

Everything not part of the ASCII has to have an alternative definition if used
for identifiers.

e.g.: `<compiler.character>('α', asciiname='alpha', latex='\alpha', key='a')`
e.g.: `<compiler.character>('α', asciiname='alpha', latex='\alpha', key='a')`

```python
    UPPERCASE_LATIN_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    LOWERCASE_LATIN_CHARACTERS = "abcdefghijklmnopqrstuvwxyz"
    LOWERCASE_GREEK_CHARACTERS = "αβγδεζηθικλμνξοπρστυφχψω"
    UPPERCASE_GREEK_CHARACTERS = "ABΓΔEZHΘIKΛMNΞOΠΡΣTYΦXΨΩ"
    LOWERCASE_ALT_GREEK_CHARACTERS = "ϐϵϑϰϖϱς"
```

Everything is an object, because that is kind of convenient.
I.e. `A = 3` will be converted to 3 objects:
  * `<name> A` the identifier I want to assign to
  * `<operator> =` the operator I want to use
  * `<number> 3` the number 3
