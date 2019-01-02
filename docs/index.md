# Mammal

## 1 The asm package

This package is needed if you want to compile with an executable as target.
This is as low level as it gets but still written down in mammal, to make
use of optimization procedures and compile- as well as run-time error checking.


### 1.1 Data types

The following classes represent a value which you might save to a register.
They don't specify whether you handle the value as a
*float*, *integer* or *char* yet.

### 1.1 Memory Locations

Memory Locations have a length, but it isn't specified what value they have yet.

Class       | Size (bits) | Size (bytes)
------------|------------:|-------------:
`Byte`      |         8   |         1
`Word`      |        16   |         2
`DWord`     |        32   |         4
`QWord`     |        64   |         8
`DQWord`    |       128   |        16

Each of the values can be handled as several Types.
```python
  a = Byte()
  a.unsigned = 255  # Value is set to 255
  a.signed == -1  # This is -1 in two-complement, so this would be true
  a.char = '!'  # changes to the ASCII-Code of '!'
  a.unsigned == 0x12  # Also true
  a <- 123  # Will work with all integers from -127 to 255 and chars.

  b = Word('€')  # Initializes b with the UTF-16 codepoint for '€'
  b.signed == 0x20AC  # this is it

  c = DWord(-7.75)  # uses IEEE 754 32-bit floating-point representation
  c.signed == 0xC0F80000  # yes, it is an easy one
  c.char = '𤽜'  # would not fit into 16 bit, but into UTF-32

  d = QWord()
  d.float = 128.336  # uses IEEE 754 64-bit floating-point representation
  d.address  # the address where d is saved (currently)
```


### 1.2 Registers

You can create a general purpose `Register`-object for the following registers:

| 64-bit register | Lowest 32-bits | Lowest 16-bits | Lowest 8-bits | Special
|------|------|------|------|-----
| rax  |  eax |  ax  |   al |  ah
| rbx  |  ebx |  bx  |   bl |  bh
| rcx  |  ecx |  cx  |   cl |  ch
| rdx  |  edx |  dx  |   dl |  dh
| rsi  |  esi |  si  |  sil |  
| rdi  |  edi |  di  |  dil |
| rbp  |  ebp |  bp  |  bpl | Base pointer
| rsp  |  esp |  sp  |  spl | Stack pointer
| r8   |  r8d |  r8w |  r8b |
| r9   |  r9d |  r9w |  r9b |
| r10  | r10d | r10w | r10b |
| r11  | r11d | r11w | r11b |
| r12  | r12d | r12w | r12b |
| r13  | r13d | r13w | r13b |
| r14  | r14d | r14w | r14b |
| r15  | r15d | r15w | r15b |

The vars are just suggestions. Normally those make for horrible variable names,
but since *rax*,*rbx*,*rcx* and *rdx* have special uses in some cases,
it makes sense to refer to them directly.
*r8* to *r15* are interchangeable, so you mostly just pick one which is available.
For convenience *r1* would also refer to *rax*.

There are some really nice 128-bit registers too:
*xmm0*, *xmm1*, *xmm2*, ..., *xmm15*.
If supported you can even use 256-bit versions of those!

You can also create the *rip* with the class `InstructionPointerRegister` and
the *rFlags* with `FlagRegister`.
Additionally `BasePointerRegister` and `StackPointerRegister` are available for
`rbp` and `rsp` respectively.

Some weird ones are the tuple of registers.  Those are needed for some
operations:
  * The *dx:ax* tuple with `DxAxRegisterTuple()`.
  * The *edx:eax* tuple with `EdxEaxRegisterTuple()`.
You can‘t really use them for most for many operations.

```python
  a = Register('rax')  # Give me rax and only rax
  tmp = Register('r*', free=true)  # I do not care which one I get
  x = Register('r*x', free=true)  # Give me a,b,c or d (well a is, gone, so it will be rax)
```

Registers support the *mapsFrom*, e.g. `a <- 5555` assigns the bit
representation for 555 to *rax*.
A register is *free* if no name is bound to it at that point in time.
You can trust different threads to not overlap register-wise. They are backed up
in memory (cpu-cache) before switching to a different thread on the same processor.

**Warning:** Don’t do something like `a = 5`, since this will not set the value
in register *rax* to 5 as you might think, but binds a new object (5) to `a`.


### 1.3 The *rFlags* register

```python
  flags = FlagRegister()
  print(flags.parity)  # Has the last byte an even parity
  print(flags.adjust)  # Support Binary Coded Decimal operations
  print(flags.zero)  # Did the last operation result in a zero result
  print(flags.sign)  # Did the last operation result in 1 in the most significant bit
  print(flags.direction)  # direction (increment of decrement) for some string operations
  print(flags.overflow)  # Did the last operation result in an overflow
```

### 1.4 Operands

There are the operands, which are to be expected, all of them are functions,
as this is really convenient.


The moving function `dest.mov(src)`:

```python
    foo = Word('foo')  # Creates a Word variable in Memory
    Register('eax').mov(15)  # Moves the constant 15 into eax ¹
    Register('ebx').mov(Pointer(0x123456))  # Moves the content of the address to ebx
    Register('cx').mov(foo)
    Register('r8').mov(foo.address)  # Moves the address of `foo` to r8
```
¹: `register.mov(src)` is the same as `register <- src`

Widening of a smaller size to a larger one can be done with `dest.movzx(src)`.
The signed version of this is `dest.movsx(src)`.

Some things are not implemented, since they are silly:
  * `ax.cbw()` is instead `ax.movesx(al)`.
  * `dx_ax.cwd()` is instead `dx_ax.movesx(ax)`.
  * `eax.cwde()` is instead `eax.movsx(ax)`.
  * `edx_eax.cdq()` is instead `edx_eax.movsx(eax)`.
  * `rax.cdqe()` is instead `rax.movsx(eax)`.
  * `rdx_rax.cqo()` is instead `rdx_rax.movsx(rax)`.
  * `reg64.movsxd(src32)` is instead `reg64.movsx(src32)`.

Those are implemented as just throwing you a `NotImplementedError`.

```python
  register.add()
  dest.inc()
  register.adc()
```
