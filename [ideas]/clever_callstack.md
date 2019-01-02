# The clever callstack

The callstack saves the following for each call on the stack:
* the *function* being called (and under which name-binding)
* the variables of the function context
* the return value


Thus one can follow each variable to find out how its value was produced.

```
1  c := 4
2  a := 5
3  
4  b := a + 3
5  
6  if c = 4:
7      c := b
```

Now `c` would know that it was assigned to in 1 and then changed in 7, which again was created in 4 from a defined in 2.
