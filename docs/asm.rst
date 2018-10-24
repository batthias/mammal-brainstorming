===========================
Writing ASM in Mammal
===========================

In the end every command has to become a series of machine instructions.
Those are abstracted as a series of operators on the *register space*, that perform a transformation.
The *AST* can thus be transformed to some more useful stuff.
As every operator also has some cost (memory, time and energy wise) associated to it, you can pick the *cheapest*
operation that creates the wanted result.

As an example we use the *8086* processor structure, which is not very representative of modern CPUs and GPUs,
but is relatively easy to describe. It also shows many concepts of modern processors.
Sometime we hint at the *x86* structures too.


Registers
=========

*Mammal* kind of ignores what registers are intended for. Important is only what the fastest implementation will be.
In many cases code is even written register-agnostic, allowing you to often save a few cycles in between.
If of course a command can only use a certain register (like ``MUL`` with ``AX``, ``BX`` and ``DX``) it can only use
those.

**General purpose registers:** Used preferably for many commands
    There are four of those. The *Accumulatior Register* ``AX``, *Base Register* ``BX``, *Counter Register* ``CX``
    and *Data register* ``DX``.

**Index registers:** Also used for all kinds of purposes.
    There are two of those, the *Source Index Register* ``SI`` and the *Destination Index Register* ``DI``.

**Stack registers:** Since the stack is not really used a lot by Mammal, those are used for all kinds of other
    purposes.
    There are three of those, the *Stack Segment Register* ``SS``, the *Stack Pointer Register** ``SP`` and
    the *Base Pointer Register* ``BP``.
    **TODO:** maybe sometimes use some trickery with those.

**Instruction pointer:** Cannot be used for much else. ``IP``.

**Flags register:** The Flag register is used to save a few cycles in ifs, loops and other conditional stuff.
    There are the following flags:

    ===  =========== ======
    bit  Name        Short
    ===  =========== ======
     11  Overflow    ``OF``
     10  Direction   ``DF``
      9  Interrupt   ``IF``
      8  Trap        ``TF``
      7  Sign        ``SF``
      6  Zero        ``ZF``
      4  Auxilary    ``AF``
      2  Parity      ``PF``
      0  Carry       ``CF``

**Segment registers:** Can only be used to by addressing stuff so they are not used directly.
    There are four of those.
    The *Code Segment* ``CS``, ``DS``, ``ES`` and the aforementioned ``SS``.

**Interrupts:** The hardware interrupts can unfortunately mean that a program is not 100% deterministic.


If you prepend an ``E`` in front of one of of those registers it is the 32-bit version and prepending an
``R`` specifies the 64-bit precision.



**TODO:** move this and quote everything (with a regex)

A few characters are done with operations (i.e. )
 * Rotating a character 180° (inverting) is ``inv``
 * mirroring a character horizontally (reverse) is called ``rev``
 * combining a character with another is called ``+``
 * creating a vulgar fraction is called ``frac``
 * superscripting is called ``sup``
 * subscripting is called ``sub``

Char  Name          HTML        Latex              Unicode   Long Name
====  ============  ==========  =================  =======   =============================================
      sHy           &shy;                           U+00AD   SOFT HYPHEN

 ¡    inv excl      &iexcl;     \textexclaimdown    U+00A1   INVERTED EXCLAMATION MARK
 ¿    inv quest     &iquest;                        U+00BF   INVERTED QUESTION MARK
 ¢    cent          &cent;      \                   U+00A2   CENT SIGN
 £    pound         &pound;                         U+00A3   POUND SIGN
 ¤    currency      &curren;                        U+00A4   CURRENCY SIGN
 ¥    yen           &yen;                           U+00A5   YEN SIGN

 ¨    diaresis      &uml;                           U+00A8   DIAERESIS
 ¯    macron        &macr;                          U+00AF   MACRON
 ´    acute         &acute;                         U+00B4   ACUTE ACCENT
 ¸    cedilla       &cedil;                         U+00B8   CEDILLA

 ©    copyright     &copy;      \copyright          U+00A9   COPYRIGHT SIGN
 ®    registered    &reg;       \textregistered     U+00AE   REGISTERED SIGN
 ª    ordF          &ordf;      \textordfeminine    U+00AA   FEMININE ORDINAL INDICATOR
 º    ordM          &ordm;      \textordmasculine   U+00BA   MASCULINE ORDINAL INDICATOR
 °    degree        &deg;                           U+00B0   DEGREE SIGN
 µ    micro         &micro;                         U+00B5   MICRO SIGN

 «    lDAQuo        &laquo;                         U+00AB   LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
 »    rDAQuo        &raquo;                         U+00BB   RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
 ¦    brokenBar	    &brvbar;                        U+00A6   BROKEN BAR

 ¬    not           &not;                           U+00AC   NOT SIGN
 ·    midDot        &middot;    \cdot               U+00B7   MIDDLE DOT
 ±    plus + minus  &plusmn;                        U+00B1   PLUS-MINUS SIGN
 ×    times         &times;                         U+00D7   MULTIPLICATION SIGN
 ÷    divide        &divide;                        U+00F7   DIVISION SIGN

 ¹    sup 1         &sup1;      ^1                  U+00B9   SUPERSCRIPT ONE
 ²    sup 2         &sup2;      ^2                  U+00B2   SUPERSCRIPT TWO
 ³    sup3          &sup3;      ^3                  U+00B3   SUPERSCRIPT THREE
 ¼    frac 1 4      &frac14;                        U+00BC   VULGAR FRACTION ONE QUARTER
 ½    frac 1 2 	    &frac12;                        U+00BD   VULGAR FRACTION ONE HALF
 ¾    frac 3 4      &frac34;                        U+00BE   VULGAR FRACTION THREE QUARTERS

 §    section       &sect;                          U+00A7   SECTION SIGN
 ¶    pilcrow       &para;      \P                  U+00B6   PILCROW SIGN

 Æ    A + E         &AElig;                         U+00C6   LATIN CAPITAL LETTER AE
 Œ    O + E         &OElig;                         U+0152   LATIN CAPITAL LIGATURE OE
 Ð    Eth           &ETH;                           U+00D0   LATIN CAPITAL LETTER ETH
 Þ    Thorn         &THORN;                         U+00DE   LATIN CAPITAL LETTER THORN
 ß    sharpS        &szlig;                         U+00DF   LATIN SMALL LETTER SHARP S
 ſ    longS                                         U+017F   LATIN SMALL LETTER LONG S
 æ    ae            &aelig;                         U+00E6   LATIN SMALL LETTER AE
 œ    oe            &oelig;                         U+00E6   LATIN SMALL LIGATURE OE
 ð    eth           &eth;                           U+00F0   LATIN SMALL LETTER ETH
 þ    thorn 	    &thorn;                         U+00FE   LATIN SMALL LETTER THORN
 Ŋ    Eng                       \NG                 U+014A   LATIN CAPITAL LETTER ENG
 ŋ    eng                       \ng                 U+014B   LATIN SMALL LETTER ENG
 Ƅ    Tone6                                         U+0184   LATIN CAPITAL LETTER TONE SIX
 ƅ	  tone6                                         U+0185   LATIN SMALL LETTER TONE SIX
 Ɔ    OpenO                                         U+0186   LATIN CAPITAL LETTER OPEN O
 Ɖ    AfricanD                                      U+0189   LATIN CAPITAL LETTER AFRICAN D
 Ǝ    inv E                                         U+018E   LATIN CAPITAL LETTER REVERSED E
 Ə    Schwa                                         U+018F   LATIN CAPITAL LETTER SCHWA
 Ɛ    OpenE                                         U+0190   LATIN CAPITAL LETTER OPEN E
 Ɣ    LatinGamma                                    U+0194   LATIN CAPITAL LETTER GAMMA
 ƕ    h + v                                         U+0195   LATIN SMALL LETTER HV
 Ɩ    LatinIota                                     U+0196   LATIN CAPITAL LETTER IOTA
 Ɯ    inv M                                         U+019C   LATIN CAPITAL LETTER TURNED M
 Ƣ    O + I                                         U+01A2   LATIN CAPITAL LETTER OI
 ƣ    o + i                                         U+01A3   LATIN SMALL LETTER OI
 Ʀ    YR                                            U+01A6   LATIN CAPITAL LETTER YR
 Ƨ	  Tone2                                         U+01A7   LATIN CAPITAL LETTER TONE TWO
 ƨ    tone2                                         U+01A8   LATIN SMALL LETTER TONE TWO
 Ƽ    Tone5                                         U+01BC   LATIN CAPITAL LETTER TONE FIVE
 Ʃ    Esh                                           U+01A9   LATIN CAPITAL LETTER ESH
 Ʊ    Upsilon                                       U+01B1   LATIN CAPITAL LETTER UPSILON
 Ʒ    Ezh                                           U+01B7   LATIN CAPITAL LETTER EZH

====  ==========  ==========  =================  =======   =============================================


Commands
========

All commands are operators acting on the abstract CPU object.
I.e. the operations do not do anything but are abstract code objects which only perform the operation
when applied to a specific machine.

``mov(target, source)``     This command allows for moving one thing to another.
                            This destroys the information in ``op1`` but doesn‘t create any new information.

Possible targets are registers and memory addresses. Possible sources are registers, memory addresses and numbers.
If a number value is known at compile time this allows you to use a number as source, which is quite fast.

``xchg(place1, place2)``    This command allows for exchanging two things.
                            This does not destroy or create information.

``
