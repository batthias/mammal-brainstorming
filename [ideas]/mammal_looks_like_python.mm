# Mammal 0.1 Quick Reference Card
# Version 0.1 — matthias bosewitz

# Data types ##################################################################

# Strings:
s = "foo bar"  # will raise a StyleWarning, since you neither have a " to escape nor you are using any other fancy stuff, which would stop you from using single quotes
s = 'foo bar'  # Thats how you do it
s = r'c:\dir\new'      # raw (== 'c:\\dir\\new')
s = '''Hello
       world'''  # multiline like this
s.join(" baz")
n = s.len
'Ala ma {} psy i {} koty' % (2, 3)
"Square root of 2 is equal to {:.2f}" % (math.sqrt(2))
math.√(2)    # <- you can use this, if you want to

# Lists:

L = [1, 2, 3, 4, 5]
L[0]                                  # single position
L[0:3]                                # the first three elements
L[-2:]                                # the last two elements
L[1:4] = [7,8]                        # substitute
del L[2]                              # remove elements
L.append(x)                           # x is a value
L.remove(x)
L.extend(L2)                          # or: L3 = L + L2
L.pop()                               # simple stack (with append)
L.sort()
x in L                                # does L contain x?
x ∈ L                                 # dito, but prettier
L.index(x)                            # index of the first occurrence
[x*2 for x in L if x > 2]             # list comprehensions
[x⋅2 for x ∈ L if x > 2]              # Use some unicode if you want


# Tuples:
x = 1,2,3     # please don‘t do that (too much) (StyleWarning could be turned on)
x = (1,2,3)   # better (warnable)
x[1]
a,b,c = x     # brackets make it ugly (still warnable)


# Dictionaries:
D = {'f1': 10, 'f2': 20}              # dict creation
D = <dict>.(f1=10, f2=20)             # Don‘t do that, that‘s silly

keys = ('a', 'b', 'c')
D = <dict>.fromkeys(keys)             # new dict with empty values

for k in D: print(k)                  # keys
for v in D.values(): print(v)         # values
for k, v in D.items():                # tuples with keys and values
<list> (D.keys())                     # list of keys
sorted(D.keys())                      # sorted list of keys

S = {}
S[(1,8,5)] = 100                      # 3D sparse matrix with a dict (stupid)

<sparse_matrix> M                     # 3D sparse matrix with a Class (nice)
M[1,8,5] = 100
M == D                                # Will be True, since they are pretty much the same thing
S[(1,8,5)]
S[(1,1,1)] defaults to -1             # Check whether this is okay. ²


# Sets:
S = {1,3,5}
L = [1, 3, 1, 5, 3]
try and pass Warning:                # Will ignore the Warnings ³
  S = <set> L                        # Setifies L, will raise a Warning though

if (3 in S):
S1+S2, S1-S2, S1^S2, S1|S2

# Loops
for x in (1:5):                       # 1, 2, 3, 4, 5  (empty loops will cause a SyntaxWarning)
for x in (1:5:2):                     # 1, 3, 5

for k,v in D.items():
    print("D[{}]={}".format(k,v))     # D[f1]=10  D[f2]=20

L = [1, 3, 5]
for i,v in enumerate(L):              # (index,value)
for x,y in zip(L1, L2):               # returns tuples
for i in sorted(L): print(i)         # sorted set from a list
for x in reversed(L1):


# Functions
def `foo`(arg1, *args, **dic):
  ''' Example documentation string.

  This function does not do anything special.
  '''
  # arg1 is a positional argument
  # args is a list
  # dic is a dictionary of named arguments

def `foo`(a, b, c=0):
L = [1, 2, 3]
foo(*L)                               # unpacking a list of arguments
D = {'a': 10, 'b': 20}
foo(**D)                              # unpacking a dictionary of arguments

foo.__doc__                           # the docstring (nice, right?)


################################################################################
# Integers and their operators, functions, methods and properties:

# Constructors:
<int> number   # Casting
12             # Will be of class <int> by default
0x3f7          # hexadecimal initialization
0o15           # octal initialization
0b01010101     # binary initialization

# Operators (sorted by priority):
x or y,   x ∨ y     # If x is false, then y, else x   [100]
x and y,  x ∧ y     # If x is false, then x, else y   [110]
not x,    ¬ x       # If x is false, then True, else False [120]

x < y               # strictly less than [200]
x <= y,   x ≤ y     # less than or equal [200]
x > y               # strictly greater than [200]
x >= y,   x ≥ y     # greater than or equal [200]
x == y              # equal [200]
x ~= y,   x ≈ y     # approximately equal [200]
x != y    x ≠ y     # not equal [200]
x !~= y   x ≉ y     # not approximately equal [200]
x is y              # object identity [200]
x is not y          # negated object identity [200]

x | y               # bitwise »or« of x and y  [300]
x ^ y               # bitwise »xor« of x and y [310]
x & y               # bitwise »and« of x and y [320]
x << n              # x shifted left by n bits [330]
x >> n              # x shifted right by n bits [330]

x + y               # sum of x and y [400]
x - y,    x − y     # difference of x and y [400]
x * y, 	  x ⋅ y     # product of x and y [410]
x / y, 	  x ÷ y     # quotient of x and y (returns <fraction>!) [410]
x // y,   x ⊘ y     # floored quotient of x and y [410]
x % y 	            # remainder of x / y [410]
-x,       x − y     # x negated [420]
+x 	                # x unchanged [420]
~x                  # The bits of x inverted [420]
x ** y              # x to the power y [430]

# Functions (class-methods, which are exported to the namespace automatically)
abs(x),   |x|       # absolute value or magnitude of x
floor(x), ⌊x⌋       # the greatest Integral <= x
ceil(x),  ⌈x⌉       # the least Integral >= x

# Integers are numbers n ∈ ℤ. Almost all implementations will use a limited
# amount of memory to represent those. This is a dangerous source of errors,
# but you cannot use infinite numbers. So do expect overflows, when using very
# large numbers!


# Sequence Types (list, tuple, range)
x in s,     x ∈ s     # True if an item of s is equal to x, else False [200]
x not in s, x ∉ s	  # False if an item of s is equal to x, else True [200]
s union t,  s ∪ t 	  # the concatenation of s and t [400]
s * n, s ⋅ n  	      # equivalent to adding s to itself n times [410]

# Functions
s[i] 	              # ith item of s, origin 0
s[i:j]                #	slice of s from i to j (so just a range in brackets)
s[i:j:k] 	          # slice of s from i to j with step k
s.len() 	          # length of s
s.min()               #	smallest item of s
s.max() 	          # largest item of s
s.index(x, i, j) 	  # index of the first occurrence of x in s (at or after index i and before index j)
s.count(x)            #	total number of occurrences of x in s


###############################################################################
# Footnotes:
# 1: Technically slicing is just the general form of Indexing
#    You could define a range
rng = (m:n) # and use
x[rng]      # to do the same thing.

# 2: »defaults to« can be used to catch
#    None, ValueError and ArrayAccessError in a nice way

# 3: One could of course replace the »try and pass« syntax by a block like
try:
  S = <set> L
except Warning: pass
# but the other way is more convenient and readable for warnings
