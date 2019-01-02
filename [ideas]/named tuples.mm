#!/usr/bin/env mammal -v aardvark

# Create a normal tuple
tuple := (100, 200, 300)

tuple[1] = 1
tuple[$] = 3
tuple[1…2] = [1,2]
tuple.find(200) = [2]
tuple.withoutKey() = [100, 200, 300]
tuple.values = tuple
tuple.keys = [None, None, None]

# Create a named tuple
namedTuple := (hello: 10, world: 20, "!": 30, 40)

namedTuple{"hello"} = 10
namedTuple[2] = 20
namedTuple{"!"} = 30
namedTuple[4] = 40

namedTuple.indexOfKey("!") = 3
namedTuple.keyOfIndex(2) = "world"
namedTuple.find(20) = [1]
namedTuple.findKey("world") = 20
namedTuple.withoutKey() = [40]
namedTuple.keys = ["hello", "world", "!", None]
namedTuple.values = [10, 20, 30, 40]

# packing and unpacking things
first, *rest := namedTuple
first = 10 and rest = namedTuple[2…]
namedTuple = (10, *[20, 30, 40])

# unpack into first (possibly second, which is 5 instead and the rest)
(first: <int>, second: <int> 5, *rest: <[int]>) := namedTuple
