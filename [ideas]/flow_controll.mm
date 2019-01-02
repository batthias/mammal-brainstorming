#!/usr/bin/env mammal -v aardvark


# The condition-chain ----------------------------------------------------------
# Those statements are used to handle conditions.

# Starts a condition-chain
# Execute the block if `<bool> condition` is true
if condition:
    doSomething()

# Starts a condition-chain
# Execute one of the blocks if the expression matches one of the cases
# The standard `comparisonOperator` used is `=`, but you can specify others.
switch expression ⟨with `comparisonOperator`⟩:
    case1: doSomething()
    case2: doSomethingElse()
    case3, case4: doSomeOtherThings()

# Execute the block if none of the flow-blocks before were triggered
else:
    doSomethingElse()

# Execute the block if,
# • none of the flow-blocks before were triggered
# • `<bool> condition` is true
else if condition:
    doSomeOtherThing()

# Execute one of the blocks if,
# • none of the flow-blocks before were triggered
# • the expression matches one of the cases
else switch expression ⟨with `comparisonOperator`⟩:
    case1: doSomething()
    case2: doSomethingElse()

# Execute the block if any of the flow-blocks before was triggered
# If you want to find out whether you left via `break`, `continue` or `return`
# use `with`, `exitStatement` will be set to the exit statement
finally ⟨with exitStatement⟩:
    doSomethingRegardless()


# The try-chain ----------------------------------------------------------------

# Starts a try-chain
# Execute the block and catch errors
try:
    tryDoingSomething()

# Execute the block if `<SomeException>` (or a subclass of it) occured
except <SomeException> ⟨as e⟩:
    handleTheException(⟨e⟩)

# Execute the block if `<A>`, `<B>` or `<C>` occured
except <A>, <B>, <C> ⟨as e⟩:
    handleThoseExceptions(e)

# Execute the block if no exception was triggered
else:
    continueDoingSomething()

# Execute the block if no exception was trigged and conditions are met
else if ..., else switch ...

# Executed regardless, if an exception was raised or not
# If you want to find out whether you left via `break`, `continue` or `return`
# use `with`, `exitStatement` will be set to the exit statement
finally ⟨with exitStatement⟩:
    doSomethingRegardless()


# The loop-chain ---------------------------------------------------------------
# `for` and `while` loops

# Starts a loop-chain
# Executes the block repeatedly for each element
for item in iterable:
    doSomethingWith(item)

# Starts a loop-chain
# Executes the block repeatedly while `<bool> condition` is true
while condition:
    doSomething()

# Execute the block if the loop wasn't left prematurely
else:
    doSomeFinalThings()

# Execute the block if the loop wasn't left prematurely and conditions are met
else if ..., else switch ...

# Executed after the loop, no matter if continue or return or whatever was called
# You most certanly want to find out whether you left via `break`, or `return`
# (otherwise you wouldn't need finally).
# Use `with`, `exitStatement` will be set to the exit statement.
finally ⟨with exitStatement⟩:
    doSomethingRegardless()
