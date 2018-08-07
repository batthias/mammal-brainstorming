#!/usr/bin/env mammal -v aardvark

# create a nice operator for joining
createOperator
    `join {iterator} with {glue}`,
    (iterator: <+iter>, glue: <str>) -> glue.join(iterator)

# From now on, join is a keyword and cannot



__main__ := (<str> name, <str[]> *args) -> <str>
    print(f"Hello {name}!")
    return "Bye {join args with ', '}!"
