## Starting Out
Ready, set, go!

Alright, let’s get started!
If you are the sort of horrible person who doesn’t read introductions
to things and you skipped it, you might want to read the last section in
the introduction anyway because it explains what you need to follow
this tutorial and how we’re going to load functions.
The first thing we’re going to do is run mammal’s interactive mode
and call some function to get a very basic feel for mammal.
Open your terminal and type in `mammal`.
You will be greeted with something like this.

    Mammal, version 0.1: http://www.conepictures.de/mammal/
    :? for help
    Loading base packages ... done.  
    ➤

Congratulations, you are in the mammal console!
The prompt here is `➤`. If you don’t see that character your terminal doesn’t
support unicode properly, so you should check
[unicode troubleshooting](troubleshooting_unicode.md)
for help.

Here is some simple arithmetic.

    ➤ 2 + 15
    17
    ➤ 49 ⋅ 100
    4900
    ➤ 1892 − 1472
    420
    ➤ 5 / 2
    2.5  

This is pretty self-explanatory. We can also use several
operators on one line and all the usual precedence rules are obeyed.
We can use parentheses to make the precedence explicit or to change it.

    ➤ (50 ⋅ 100) − 4999
    1
    ➤ 50 ⋅ 100 − 4999
    1
    ➤ 50 ⋅ (100 − 4999)
    -244950
    ➤ 5 ⋅ -3
    -15

Pretty cool, huh? Yeah, I know it’s not but bear with me.
Other than most programming languages mammal uses the mathematical `⋅` instead
of `*` — which is instead used to denote the complex conjugate, e.g. `z*`.

Have you noticed that the minus sign and the minus operator look different?
This isn’t really a pitfall to watch out for; you can use `-` *(hyphen)*
and `−` *(minus-sign)* interchangeably.
The style recommendation is to only use the hyphen as the minus sign.

Boolean algebra is also pretty straightforward.
Just use the keywords `and`, `or`, `not`, `xor`.

    ➤ True and False
    False
    ➤ True and True
    True
    ➤ False or True
    True
    ➤ not False
    True
    ➤ not (True and True)  
    False

The symbols `∧`, `∨`, `¬`, `⊕` are not used since they aren’t very readable.
But if you really want to, you can import them.

    ➤ import logic.operators: `∧`, `∨`, `¬`, `⊕`
    ➤ (True ∧ False) ∨ (True ⊕ ¬False)
    False

Testing for equality is also done in standard math notation.

    ➤ 5 = 5  
    True  
    ➤ 1 = 0  
    False  
    ➤ 5 ≠ 5  
    False  
    ➤ 5 ≠ 4  
    True
    ➤ "hello" = "hello"  
    True

What about doing `5 + "llama"` or `5 == True`?
Well, if we try the first snippet, we get a big scary error message!

Yikes! What mammal is telling us here is that `5` doesn’t support adding strings
to and and neither does `"llama"` support adding numbers and so it doesn’t know
what `5 + "llama"` is supposed to mean. Even if it wasn‘t `"llama"`
but `"four"` or `"4"`, mammal still wouldn’t consider it to be a number.
If we tried to do `True = 5`, mammal would tell us that the types don’t match.
`=` works on any two things that can be compared, but the both have to belong
to compatible *classes*. You can’t compare apples and oranges.
We’ll take a closer look at classes a bit later.

**Note:** you can do 5 + 4.0 because 5 is sneaky and can act like an integer
or a floating-point number.

You may not have noticed it, but we’ve been using functions now all along.
For instance, `⋅` calls a function that takes two arguments and
multiplies them. As you’ve seen, we call it by sandwiching it between them.
This is what we call a binary operator. Most functions don’t have an operator,
but can only be called as prefix functions. Let’s take a look at them.

In most programming languages (and mathematics) functions are called by writing
the function name and then writing its parameters in parentheses,
usually separated by commas. That is exactly how mammal does it, since it tries
to emulate math-notation wherever feasable.

    ➤ sin(π) + cos(0)
    0.0

**Sidenote:** In Haskell (from which mammal heavily borrows), functions are
called by writing the function name, a space and then the parameters,
separated by spaces. This is often shorter, but almost never more readable.
For the few cases where you might wan’t to drop the parenthesis to emulate
standard math notation, define yourself an operator.

    ➤ __operators__.add("sinus", "sin {}", sin)
    ➤ sin π + cos π
    1.0

The `sin` and `cos` function are *sine* and *cosine* like you would expect.
They work for real and complex numbers and also square matrices.
The functions `min` and `max` take two things that can be put in an order
(like numbers!). `min` returns the one that’s lesser and `max` returns the
one that‘s greater. See for yourself:

    ➤ min(9, 10)
    9
    ➤ min(3.4, 3.2)
    3.2
    ➤ max(100, 101)
    101

## Baby’s first functions

In the previous section we got a basic feel for calling functions.
Now let’s try making our own! Open up your favorite text editor —
which supports unicode, otherwise get a new one — and punch in
this function that takes a number and multiplies it by two.

    doubleMe := (x) -> x + x

Function definitions use the special operator `->`. On the left there are the
parameters (in paranthesis and eperated by commas) and on the right is what the
function does. To use the function you assign it to a name via the assignment
operator `:=`. Save this as `baby.mm` or something.
Now navigate to where it is saved and run mammal from there.
Once inside the mammal cli, we need to import our script. Once it is loaded we
can use the function that we defined.

    ➤ import .baby: doubleMe
    ➤ doubleMe(9)
    18
    ➤ doubleMe(8.3)
    16.6

Because `+` works on integers, reals, complex numbers, strings, matrices etc.,
our function also works on any number. Let’s make a function that takes two
numbers and multiplies each by two and then adds them together.

    ➤ doubleUs := (x, y) -> 2⋅x + 2⋅y

Simple. We could have also defined it as `doubleUs := (x,y) -> x + x + y + y`.
Testing it out produces pretty predictable results.
**Note:** This time we only defined this function locally; you could also
append to the `baby.mm` file, and then import it.

    ➤ doubleUs(4, 9)
    26  
    ➤ doubleUs(2.3, 34.2)  
    73.0
    ➤ doubleUs(28, 88) + doubleMe(123)
    478

As expected, you can call your own functions from other functions that you made.
With that in mind, we could redefine `doubleUs` like this:

    ➤ doubleUs := (x, y) -> doubleMe(x) + doubleMe(y)

This is a very simple example of a common pattern you will see throughout mammal.
Making basic functions that are obviously correct and then combining them into
more complex functions. This way you also avoid repetition.
What if some mathematicians figured out that 2 is actually 3 and you had to
change your program? You could just redefine `doubleMe` to be `x + x + x` and
since `doubleUs` calls `doubleMe`, it would automatically work in this strange
new world where 2 is 3.

Functions in mammal don’t have to be in any particular order, so it doesn’t
matter if you define `doubleMe` first and then `doubleUs` or if you do it the
other way around.

**Note:** A pitfall may arise when calling a function before
it is defined — this doesn’t work.
Even worse; assume you use variable names.

    ➤ <var> doubleMe := (x) -> x + x
    ➤ doubleUs := (x, y) -> doubleMe(x) + doubleMe(y)
    ➤ doubleUs(3, 2)
    Error: constant `doubleMe` isn’t defined ...

What happened here? Well `doubleMe` is no longer a constant
(which can be used in a function without problem) but a variable name.
Variable names are a slightly unfunctional (but often useful)
approach for reusing names for different values.
How would you solve this (assuming you need `doubleMe` to be a `<var>`)?
Well you can pass it as a parameter:
    ➤ doubleUs := (x, y, doubler) -> doubler(x) + doubler(y)
If this is too bulky for you you might want to take a look at classes.

Now we‘re going to make a function that multiplies a number by 2 but
only if that number is smaller than or equal to 100 because numbers
bigger than 100 are big enough as it is!

    ➤ doubleSmallNumber := (x) -> x if x > 100 else 2⋅x

Right here we introduced mammal‘s inline `if` statement.
You’re probably familiar with *if* statements from other languages.
If you know python this will seem very familiar to you.
This kind of if statement (with a mandatory `else`) is an expression.
An expression is basically a piece of code that returns a value.
5 is an expression, because it returns 5; 4 + 8 is an expression;
x + y is an expression, because it returns the sum of x and y.
Because the `else` is mandatory, an if statement will always return
something and that‘s why it‘s an expression.
If we wanted to add one to every number that‘s produced in our
previous function, we could have written its body like this.

    ➤ doubleSmallNumber_1 := (x) -> (x if x > 100 else 2⋅x) + 1

Had we omitted the parentheses, it would have added one only if `x`
wasn‘t greater than 100.


## An intro to lists

Much like shopping lists in the real world, lists (or tuples) in
mammal are very useful. It is the most used data structure and
it can be used in a multitude of different ways to model and
solve a whole bunch of problems. Lists are SO awesome.
In this section we‘ll look at the basics of lists, strings
(which behave pretty much like lists) and list comprehensions.

In mammal, lists are a heterogenous data structure.
It stores several elements of any type.
That means that we can have a list that has a few integers and
then a few characters and so on. And now, a list!

    ➤ mixedList := (1, 2, "a", 3, "b", "c", 4)
    ➤ lostNumbers := (4, 8, 15, 16, 23, 42)
    ➤ lostNumbers
    4, 8, 15, 16, 23, 42

As you can see, lists are denoted by parentheses
(which are actually mostly optional) and the values in the
lists are separated by commas.

Strings mostly just behave like lists of characters, as we will see in the examples.
A common task is putting two lists together. This is done by using the `∪` operator.

    ➤ (1,2,3,4) ∪ (9,10,11,12)
    1, 2, 3, 4, 9, 10, 11, 12
    ➤ "hello" + " " + "world"
    "hello world"  

Note: `()`, `((),)` and `((),(),())` are all different things.
The first one is an empty list, the seconds one is a list that contains
one empty list, the third one is a list that contains three empty lists.
In the second example you can see a trailing comma. This is necessary since
otherwise mammal will assume the outer brackets are just brackets.

If you want to get an element out of a list by index, use `[idx]`.
The indices start at 1, as is customary in mathematics.

    ➤ "Steve Buscemi"[7]
    "B"
    ➤ (9.4, 33.2, 96.2, 11.2, 23.25)[2]  
    33.2

But if you try to get the sixth element from a list that only has four
elements, you‘ll get an error so be careful!

Lists can also contain lists. They can also contain lists that contain
lists that contain lists …

    ➤ b := ((1,2,3,4), (5,3,3,3), (1,2,"2½",3,4), (1,2,3))
    ➤ b  
    (1, 2, 3, 4), (5, 3, 3, 3), (1, 2, "2½", 3, 4), (1, 2, 3)
    ➤ b ∪ ((1,1,1,1),)
    (1, 2, 3, 4), (5, 3, 3, 3), (1, 2, "2½", 3, 4), (1, 2, 3), (1, 1, 1, 1)
    ➤ b.prepend((6,6,6))
    (6, 6, 6), (1, 2, 3, 4), (5, 3, 3, 3), (1, 2, "2½", 3, 4), (1, 2, 3)
    ➤ b[3]
    1, 2, "2½", 3, 4

The lists within a list can be of different lengths and types.

Lists cannot be compared, since there is no unique way of
comparing them. One could compared them in lexicographical order,
element wise, by length etc.
So just do those explicitly.

    ➤ zip((3,2,1), (2,1,0)).allMatch with (tuple) -> tuple[0] > tuple[1]
    True

What else can you do with lists? Here are some basic functions
that operate on lists.

    ➤ (5, 4, 3, 2, 1)[1]
    5
    ➤ (5, 4, 3, 2, 1)[-1]
    1
    ➤ (5, 4, 3, 2, 1)[1,…,4]
    5, 4, 3, 2
    ➤ (5, 4, 3, 2, 1)[…,-1]
    5, 4, 3, 2
    ➤ (5, 4, 3, 2, 1)[-1,…-1…]
    1, 2, 3, 4, 5
    ➤ (5, 4, 3, 2, 1).reverse()
    1, 2, 3, 4, 5

But what happens if we try to get the first element of an empty list?

    ➤ a := ()[1]
    KeyError: list `()` has no element with index `1`

Oh my! It all blows up in our face! You cannot access elements that do not exist.
Well, now what to do, if you want to access the first element?

There are two ways to go, *the good way* and *the short way*.
Let‘s start with the longer, more precise way.

    ➤ try:
        a := ()[1]
      catch KeyError:
        a := None
    None

Now we have a afterwards, with `None` signifying a missing value.
`None` is often used this way.
Now for *the short way*:

    ➤ a := ()[1]?
    None

This uses the *existential operator* `?`, which means that
a `KeyError` — and some other Errors — will be caught by the
program and turned into a `None` value. Try to only use it for
such *simple cases*, where the try-catch block would make
your code too verbose.

You can also check the length of your list beforehand,

    ➤ (5,4,3,2,1).length
    5

Checking if a list is empty is easier than this though,
since an empty list evaluates to false in a conditional
statement:
    ➤ 'not empty' if () else 'empty'
    'empty'

Let‘s do some more stuff with our lists:

`list.max()` takes a list of stuff that can be put in some
kind of order and returns the biggest element.
As we saw earlier you can also use `max(a, b, c)` to
determine the maximum of three variables, so for simplicity
`max((a, b, c))` does exactly the same.
`list.min()` and `min(list)` work in the same way but
return the smallest element.

    ➤ (8,4,2,1,5,6).min()
    1
    ➤ (8,2,1,6).min() = min((8,2,1,6)) = 1
    True
    ➤ (1,9,2,3,4).max()
    9

`list.sum()` takes a list of numbers and returns their sum.
`list.product()` takes a list of numbers and returns their product.

    ➤ (5,2,1,6,3,2,5,7).sum()
    31
    ➤ (6,2,1,2).product()
    24
    ➤ (1,2,5,6,7,9,2,0).product()  
    0

The `in` keyword takes a thing and a list of things and tells
us if that thing is an element of the list.

    ➤ 4 in (3,4,5,6)  
    True
    ➤ 10 in (3,4,5,6)
    False

Those were a few basic functions that operate on lists.
We‘ll take a look at more list functions later.


## Series

In a sense a series is an infinite list. Most things
that work with a list will work with a series too.

    ➤ s = k² for k in 1…
    ➤ min(s)
    1
    ➤ max(s)
    AggregationError: There is no maximum element, as the series is monotonically increasing.
    ➤ sup(s)
    ∞
    ➤ max(
        sin(x) for x in 1…
      )
    AggregationError: Maximum could not be determined — and might not exist — as the series is fluctuating.
    ➤ sup(
        sin(x) for x in 1…
      )
    1

## Texas ranges

What if we want a list of all numbers between 1 and 20?
Sure, we could just type them all out, but obviously that‘s
not a solution for gentlemen who demand excellence from
their programming languages. Instead, we‘ll use ranges.
Ranges are a way of making lists that are arithmetic
sequences of elements that can be enumerated.
Numbers can be enumerated. One, two, three, four, etc.
Characters can also be enumerated.
The alphabet is an enumeration of characters from `A` to `Z`.
Names can’t be enumerated. What comes after `"John"`?
I don’t know.

To make a list containing all the natural numbers
from 1 to 20, you just write `(1…20)`.
That is the equivalent of writing
`(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)`
and there’s no difference between writing one or the other
except that writing out long enumeration sequences manually is stupid.

    ➤ 1…20
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20

    ➤ "a"…"z"
    "abcdefghijklmnopqrstuvwxyz"
    ➤ "K"…"Z"
    "KLMNOPQRSTUVWXYZ"   

Ranges are cool because you can also specify a step.
What if we want all even numbers between 1 and 20?
Or every third number between 1 and 20?

    ➤ 2…+4…20
    2, 4, 6, 8, 10, 12, 14, 16, 18, 20

    ➤ 3…+3…20
    3, 6, 9, 12, 15, 18   

To make a list with all the numbers from 20 to 1,
you can’t just do `20…1`, you have to do `20…-1…1`.
This is good for you, as it helps you to avoid mistakes!
Consider the following:

    ➤ k, l := 7, 9
    ➤ n := k - l
    ➤ 1…n
    ()

This is what you expect. You don‘t expect for the
list to change direction if you specify different values
for `k` and `l`.

Watch out when using floating point numbers in ranges!
You have to Watch out using floating point numbers in general
*anywhere* — they are not the same as real numbers.
Since they are not completely precise (by definition),
their use in ranges can yield some pretty funky results.

    ➤ (0.1, 0.3 … 1.1)
    0.1, 0.3, 0.5, 0.7, 0.8999999999999999 1.0999999999999999

My advice is not to use them in list ranges.

You can also use ranges to make infinite lists (called series)
by just not specifying an upper limit.
Later we‘ll go into more detail on infinite lists.
For now, let’s examine how you would get the first 24 multiples of `13`.
Sure, you could do `(13 … +13 … 24*13)`; but there is a better way:
`(13…+13…)[1…24]`.
Because mammal is lazy, it won‘t try to evaluate the infinite list
immediately because it would never finish. It will wait to see what you
want to get out of that infinite list. And here it sees you just want
the first 24 elements and it gladly obliges.

`list.cycle()` cycles a list into an infinite list.
If you just try to display the result, it will go on forever so you
have to slice it off somewhere.
    ➤ (1,2,3).cycle()[1…10]  
    1, 2, 3, 1, 2, 3, 1, 2, 3, 1
    ➤ "LOL ".cycle()[1…11]
    "LOL LOL LOL"


## I’m a list comprehension

If you have ever taken a course in mathematics,
you have probably run into set comprehensions.
They‘re normally used for building more specific sets out of general sets.
A basic comprehension for a set that contains the first ten even natural
numbers is set notation. The part before the pipe is called the output function,
`x` is the variable, `N` is the input set and `x <= 10` is the predicate.
That means that the set contains the doubles of all natural numbers
that satisfy the predicate.

If we wanted to write that in mammal, we could do something like
`(2…+2…)[1…10]`.
But what if we didn‘t want doubles of the first 10 natural numbers,
but some kind of more complex function applied on them?
We can use a list comprehension for that.
List comprehensions are very similar to set comprehensions.
We‘ll stick to getting the first 10 even numbers for now.
The list comprehension we could use is `(2⋅n for n in 1…10)`.
`n` is drawn from `(1…10)` and for every element in it
(which we have bound to `n`), we get that element, only doubled.
Here‘s that comprehension in action.

    ➤ n⋅2 for n in 1…10
    2, 4, 6, 8, 10, 12, 14, 16, 18, 20

As you can see, we get the desired results.
Now let’s add a condition (or a predicate) to that comprehension.
Predicates go after the binding parts and are separated from them
by the `if` keyword.
Let’s say we want only the elements which, doubled, are greater
than or equal to 12.

    ➤ n⋅2 for n in 1…10 if n⋅2 ≥ 12
    12, 14, 16, 18, 20

Cool, it works. How about if we wanted all numbers from
50 to 100 whose remainder when divided with the number 7 is 3?
Easy.

    ➤ n for n in 50…100 if n mod 7 = 3
    52, 59, 66, 73, 80, 87, 94

Success! Note that weeding out lists by predicates is also called filtering.
We took a list of numbers and we filtered them by the predicate.
Now for another example. Let’s say we want a comprehension that replaces
each odd number greater than 10 with "BANG!" and each odd number that‘s less
than 10 with "BOOM!". If a number isn‘t odd, we throw it out of our list.
For convenience, we‘ll put that inside a function so we ca
easily reuse it.

    ➤ boomBangs := (list) -> (
        "BOOM!" if x < 10 else "BANG!"
        for x in list
        if x.isOdd()
      )
The last part of the comprehension is the predicate.
The method `isOdd` returns `True` on an odd number and `False`
on an even one. The element is included in the list only if
the predicate evaluates to True.

    ➤ boomBangs(7…13)
    "BOOM!", "BOOM!", "BANG!", "BANG!"

We can include several predicates by using `and`.
If we wanted all numbers from 10 to 20 that are not 13, 15 or 19, we‘d do:

    ➤ x for x in 10…20 if x ≠ 13 and x ≠ 15 and x ≠ 19
    10, 11, 12, 14, 16, 17, 18, 20

Not only can we have multiple predicate conditions in list comprehensions,
we can also draw from several lists.
When drawing from several lists, comprehensions produce all combinations
of the given lists and then join them by the output function we supply.
A list produced by a comprehension that draws from two lists of length 4
will have a length of 16, provided we don’t filter them.
If we have two lists, `(2,5,10)` and `(8,10,11)` and we want to get the
products of all the possible combinations between numbers in those lists,
here's what we'd do.

    ➤ x ⋅ y for x in (2,5,10) for y in (8,10,11)
    16, 20, 22, 40, 50, 55, 80, 100, 110

As expected, the length of the new list is 9.
What if we wanted all possible products that are more than 50?

    ➤ x ⋅ y for x in (2,5,10) for y in (8,10,11) if x ⋅ y > 50
    55, 80, 100, 110

How about a list comprehension that combines a list of adjectives
and a list of nouns … for epic hilarity.

    ➤ nouns := "hobo", "frog", "pope"
    ➤ adjectives := "lazy", "grouchy", "scheming"
    ➤ adjective + " " + noun for adjective in adjectives for noun in nouns
    "lazy hobo", "lazy frog", "lazy pope", "grouchy hobo", "grouchy frog",
    "grouchy pope", "scheming hobo", "scheming frog", "scheming pope"

I know! let’s write our own version of `length`! we‘ll call it `lenkth`.

    ➤ lenkth := (list) -> (1 for elm in list).sum()

This function replaces every element of a list with 1 and then sums that up.
This means that the resulting sum will be the length of our list.

Just a friendly reminder: because strings are lists,
we can use list comprehensions to process and produce strings.
Here‘s a function that takes a string and removes everything except uppercase
letters from it.

    ➤ removeNonUppercase := (str) -> (chr for chr in str if char in "A"…"Z")

Testing it out:

    ➤ removeNonUppercase("Hahaha! Ahahaha!")
    "HA"
    ➤ removeNonUppercase("IdontLIKEFROGS")
    "ILIKEFROGS"   

The predicate here does all the work.
It says that the character will be included in the new list only if
it‘s an element of the list `("A"…"Z")`. Nested list comprehensions
are also possible if you’re operating on lists that contain lists.
A list contains several lists of numbers. Let us remove all odd numbers
without flattening the list.

    ➤ xxs := ((1,3,5,2,3,1,2,4,5), (1,2,3,4,5,6,7,8,9), (1,2,4,2,1,6,3,1,3,2,3,6))
    ➤ (x for x in xs if x.isEven()) for xs in xxs
    (2, 2, 4), (2, 4, 6, 8), (2, 4, 2, 6, 2, 6)

You can write list comprehensions across several lines.
So it‘s better to split longer list comprehensions across multiple lines,
especially if they are nested.

## Tuples

tuples
In some ways, tuples are like lists — they are a way to store several values into a single value. However, there are a few fundamental differences. A list of numbers is a list of numbers. that‘s its type and it doesn’t matter if it has only one number in it or an infinite amount of numbers. Tuples, however, are used when you know exactly how many values you want to combine and its type depends on how many components it has and the types of the components. They are denoted with parentheses and their components are separated by commas.

Another key difference is that they don’t have to be homogenous. Unlike a list, a tuple can contain a combination of several types.

Think about how we'd represent a two-dimensional vector in Haskell. One way would be to use a list. That would kind of work. So what if we wanted to put a couple of vectors in a list to represent points of a shape on a two-dimensional plane? We could do something like [[1,2],[8,11],[4,5]]. The problem with that method is that we could also do stuff like [[1,2],[8,11,5],[4,5]], which Haskell has no problem with since it‘s still a list of lists with numbers but it kind of doesn’t make sense. But a tuple of size two (also called a pair) is its own type, which means that a list can’t have a couple of pairs in it and then a triple (a tuple of size three), so let’s use that instead. Instead of surrounding the vectors with square brackets, we use parentheses: [(1,2),(8,11),(4,5)]. What if we tried to make a shape like [(1,2),(8,11,5),(4,5)]? Well, we'd get this error:

Couldn't match expected type `(t, t1)'  
against inferred type `(t2, t3, t4)'  
In the expression: (8, 11, 5)  
In the expression: [(1, 2), (8, 11, 5), (4, 5)]  
In the definition of `it': it = [(1, 2), (8, 11, 5), (4, 5)]  
it‘s telling us that we tried to use a pair and a triple in the same list, which is not supposed to happen. You also couldn't make a list like [(1,2),("One",2)] because the first element of the list is a pair of numbers and the second element is a pair consisting of a string and a number. Tuples can also be used to represent a wide variety of data. For instance, if we wanted to represent someone's name and age in Haskell, we could use a triple: ("Christopher", "Walken", 55). As seen in this example, tuples can also contain lists.

Use tuples when you know in advance how many components some piece of data should have. Tuples are much more rigid because each different size of tuple is its own type, so you can’t write a general function to append an element to a tuple — you'd have to write a function for appending to a pair, one function for appending to a triple, one function for appending to a 4-tuple, etc.

While there are singleton lists, there’s no such thing as a singleton tuple. It doesn’t really make much sense when you think about it. A singleton tuple would just be the value it contains and as such would have no benefit to us.

Like lists, tuples can be compared with each other if their components can be compared. Only you can’t compare two tuples of different sizes, whereas you can compare two lists of different sizes. Two useful functions that operate on pairs:

fst takes a pair and returns its first component.

➤ fst (8,11)  
8  
➤ fst ("Wow", False)  
"Wow"  
snd takes a pair and returns its second component. Surprise!

➤ snd (8,11)  
11  
➤ snd ("Wow", False)  
False  
Note: these functions operate only on pairs. They won't work on triples, 4-tuples, 5-tuples, etc. we‘ll go over extracting data from tuples in different ways a bit later.
A cool function that produces a list of pairs: zip. It takes two lists and then zips them together into one list by joining the matching elements into pairs. it‘s a really simple function but it has loads of uses. it‘s especially useful for when you want to combine two lists in a way or traverse two lists simultaneously. Here's a demonstration.

➤ zip [1,2,3,4,5] [5,5,5,5,5]  
[(1,5),(2,5),(3,5),(4,5),(5,5)]  
➤ zip [1 .. 5] ["one", "two", "three", "four", "five"]  
[(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]  
It pairs up the elements and produces a new list. The first element goes with the first, the second with the second, etc. Notice that because pairs can have different types in them, zip can take two lists that contain different types and zip them up. What happens if the lengths of the lists don’t match?

➤ zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]  
[(5,"im"),(3,"a"),(2,"turtle")]  
The longer list simply gets cut off to match the length of the shorter one. Because Haskell is lazy, we can zip finite lists with infinite lists:

➤ zip [1..] ["apple", "orange", "cherry", "mango"]  
[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]  
look at meee
Here's a problem that combines tuples and list comprehensions: which right triangle that has integers for all sides and all sides equal to or smaller than 10 has a perimeter of 24? First, let’s try generating all triangles with sides equal to or smaller than 10:

➤ let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]   
we‘re just drawing from three lists and our output function is combining them into a triple. If you evaluate that by typing out triangles in GHCI, you‘ll get a list of all possible triangles with sides under or equal to 10. Next, we‘ll add a condition that they all have to be right triangles. we‘ll also modify this function by taking into consideration that side b isn't larger than the hypothenuse and that side a isn't larger than side b.

➤ let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]   
we‘re almost done. Now, we just modify the function by saying that we want the ones where the perimeter is 24.

➤ let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]  
➤ rightTriangles'  
[(6,8,10)]  
And there’s our answer! This is a common pattern in functional programming. You take a starting set of solutions and then you apply transformations to those solutions and filter them until you get the right ones.

Introduction	Table of contents	Types and Typeclasses
