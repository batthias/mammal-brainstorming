# Basics

Basicly there are only a few things defined.

## Code objects

`<code>` objects are defined in backticks. Every valid expression / part of an
expression can be put in a variable this way.

```python
    `not blubb`  # This is an <expression> object (subclass of <code>)
    `α`          # This is a <name> object
    `and`, `+`   # These are <operator> objects
    `,`, `;`     # These are <seperator> objects
```


## Types / Classes

To specify which types you want a variable to be you can use `<type_expression>`
with a suitable *type_expression*. The `|` operator can be used to define types.


```mammal
    <int> = <sys.integer>
    <str> = <sys.string>
    <bool> = <sys.boolean>
    <opossum>  # the class <__currentmodule__.opossum>, assuming this exists.
    <int|str>  # integer or string
    <*>        # all types are allowed
```

To specify which types are allowed you write it in front of the variable.
```python
    <int> α := 0     # α can only be assigned integer values
    <*> β := 7       # β can be assigned any values
    γ := 5           # γ does not have specific type restrictions
    β := γ := 'cat'  # this is fine since β can have any type, and γ is not type checked

    sin(<complex> α)  # casts α to a complex number (i.e. calls <complex>.__cast__(α))
    γ := <int|str> β  # casts β to an integer. If this fails, it casts β to a string
```

## Concat-Operations

Some operations work with/without spaces between the two operands.

`obj.attr` — The dot-Operator (attribute-access) requires you to not use spaces:
```python
    res := obj.α  # calls obj.__getAttr__('α')
    obj.α := 5    # calls obj.__setAttr__('α', 5)
```

`obj␣tuple` — The tuple-Operation (call-access) requires you to not use spaces:
```python
    obj(a,b,c)  # executes obj.__call__ with the the tuple (a,b,c) as input parameters
```

`obj␣bracketed` — The bracketed-Operation (call-access) is the same as the one for tuples:
```python
    obj(a)  # executes obj.__call__ with the tuple (a,) as input parameter
```

`obj␣list` — The list-Operation (item-access) requires you to not use spaces:
```python
    res := obj[5]    # executes obj.__getItem__(obj, 5)
    obj[8] := 12     # executes obj.__setItem__(obj, 8)
    res := obj[5,8]  # executes obj.__getItem__(obj, 5, 8)
```


## The Call-Access

When an object is called via `obj␣tuple` what happens is the following:
* It is checked whether `obj` is callable, otherwise an error is raised.
* The parameters of `tuple` are checked against `obj.__signature__`.
  If they don't match an error is raised.
* The values in `__signature__` are enriched with the values from `tuple`
  and inserted as variables into `obj.__call__`.
* `obj.__call__` is executed and its return value is returned.


## Overloading operators

To define operators like `+`, `−` or `⋅` on (your) classes you can define some
magic methods. Use the `uniqueName` property of the operator here.

```python
    def `<opossum>`:
        <int> res.age := 0

        # normally you won’t define this method yourself, but you can
        # (for example if you want to do weird stuff with it)
        # @overload
        def `__apply__(self, operator, *args)`:
            switch operator.uniqueName:  #
                case `add`:       self.__apply_add__(*args)
                case `subtract`:  self.__apply_subtract__(*args)
                case `multiply`:  self.__apply_multiply__(*args)
            else: raise <error.notImplemented>()

        def `__apply_add__(self, <int|opossum> a, <int|opossum> b)`:
            if b is self:  # wrong order
                a, b := b, a
            res := self.clone()
            if b instanceOf <opossum>:
                res.age += b.age
            else:
                res.age += b
            return res

        # ...
```


## Units

Numbers may have units, i.e. you could create something like
```python
    weight := 10kg + 200g

    print(weight)  # will return '10.2kg'
```

The most likelike case of using this is complex numbers:
```python
    z := 3.1415i
    echo 1 + exp(z)  # approximately 0
```
