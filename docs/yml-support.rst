============
YAML Support
============

Some of YAML is used in *mammal* to specify configuration.


2.1 Collections
===============

Behave pretty much as described in the YAML specs.
Block collections use indentation for scope and begin each entry on its own line.
Block sequences indicate each entry with a dash and space (``- ``).
Mappings use a colon and space (``: ``) to mark each key-value pair.
Comments begin with an octothorpe (also called a *“hash”*, *“sharp”*, *“pound”*, or *“number sign”* - ``#``).

Understanding this by example is easier. Here is one for a sequence::
    - Mark McGwire
    - Sammy Sosa
    - Ken Griffey

And here is one for a mapping of scalars to scalars::
    hr:  65     # Home runs
    avg: 0.278  # Batting average
    rbi: 147    # Runs Batted In

Here we describe mapping to sequences::
    american:
      - Boston Red Sox
      - Detroit Tigers
      - New York Yankees
    national:
      - New York Mets
      - Chicago Cubs
      - Atlanta Braves

And a sequence of mappings::
    - name: Mark McGwire
      hr:   65
      avg:  0.278
    - name: Sammy Sosa
      hr:   63
      avg:  0.288

The compact nested mapping form is preferred in all cases. Also please align the values when reasonable.
Your editor should be able to do this automatically ... unless it is really bad.

Additionally the feature ``bullet-support`` can be turned on.
Then the bullet point (``•``) can be used instead of ``-`` for sequences::
    • Yoda
    • Luke
    • Obi Wan

There are also flow styles, using explicit indicators rather than indentation to denote scope.
The flow sequence is written as a comma separated list within square brackets::
    - [name        , hr, avg  ]
    - [Mark McGwire, 65, 0.278]
    - [Sammy Sosa  , 63, 0.288]

In a similar manner, the flow mapping uses curly braces::
    Mark McGwire: {hr: 65, avg: 0.278}
    Sammy Sosa: {
        hr: 63,
        avg: 0.288
      }

Additionally the feature ``set-support`` can be turned on.
Then mappings without keywords (i.e. *sets*) are supported::
    fruit: {melon, apple, orange}

But this is not that usefull since sequences can represent the same data.


2.2 Structures
==============

Structures are used for logging in the *YAML* format. Then each logged event is a seperate document::
    ---
    timestamp: 2018-01-01 20:03:20
    event: FileNotFoundError
    message: 'The file "somefile.dat" was not found.'
    filename: 'somefile.dat'
    ---
    time: 2018-01-01 20:04:12
    event: DivisionByZeroError
    message: 'You tried to divide by zero.'
    dividend: `<int> 5`

Repeated nodes (objects) are first identified by an anchor (marked with the ampersand - ``&``),
and are then aliased (referenced with an asterisk - ``*``) thereafter::
    hr:
      - Mark McGwire
      # Following node labeled SS
      - &SS Sammy Sosa
    rbi:
      - *SS  # Subsequent occurrence
      - Ken Griffey

Each file has an anchor-list you can access when importing stuff.

Mappings between Sequences are not used anywhere.


2.3 Scalars
===========

Scalar content can be written in block notation, using a literal style (indicated by ``|``) where all line breaks
are significant::
    # ASCII Art
    var: |
      \//||\/||
      // ||  ||__

Alternatively, they can be written with the folded style (denoted by ``>``) where each line break is
folded to a space unless it ends an empty or a more-indented line::
    var: >
      Mark McGwire's
      year was crippled
      by a knee injury.

*YAML*’s flow scalars include the plain style (most examples thus far) and two quoted styles.
The double-quoted style provides escape sequences. The single-quoted style is useful when escaping is not needed::
    unicode: "Sosa did fine.\u263A"
    control: "\b1998\t1999\t2000\n"
    hex esc: "\x0d\x0a is \r\n"

    single: '"Howdy!" he cried.'
    quoted: ' # Not a ''comment''.'
    tie-fighter: '|\-*-/|'

All flow scalars can span multiple lines; line breaks are always folded::
    plain:
      This unquoted scalar
      spans many lines.

    quoted: "So does this
      quoted scalar.\n"


2.4 Tags
========

In *YAML*, untagged nodes are given a type depending on the application.

The following values would be considered integers (``<int>``)::
    canonical: 12345
    decimal: +12345
    binary: 0b101011
    octal: 0o14
    hexadecimal: 0xC00FFEE15600D

The following values would be considered rational numbers (``<frac>``)::
    canonical: 1.23015e+3
    exponential: 12.3015e+02
    fixed: 1230.15

The following values would be considered floats (``<float>``)::
    infinity: .inf
    negative infinity: -.inf
    not a number: .NaN

Some other values::
    none:
    booleans: [ true, false ]
    string: '012345'

If you want to represent (mammal) code you put the stuff in backticks::
    myvar: `var`
    expression: `4 + var / 17`

The following are timestamps (``<time>``)::
    canonical: 2001-12-15T02:59:43.1Z
    iso8601: 2001-12-14t21:59:43.10-05:00
    utc: 2017-08-30 16:19 UTC
    spaced: 2001-12-14 21:59:43 UTC-5
    date: 2002-12-14
    time: 16:32:01
    time_only minutes: 12:32
    millisecond_precision: 21:10:00.024

Explicit typing is done by preceding the value with a type definition (``<type>``)::
    not-date: !<str> 2002-04-28
    picture: <bin>.fromBase64 |
      R0lGODlhDAAMAIQAAP//9/X17unp5WZmZgAAAOfn515eXv
      Pz7Y6OjuDg4J+fn5OTk6enp56enmleECcgggoBADs=

In this example the ``fromBase64`` method of the ``<bin>`` class is used.
In normal code <bin>.fromBase64 could be used.

The other tag mechanism is ugly and not used.


2.5 Importing other files
=========================

You can import another files config options by doing::
    property_to_be_filled:
        <<: filename.yml

If you only want to use a specific part of an imported yml you can use::
    property_to_be_filled:
        <<: path/filename.yml#path.to.property

Here the part after the ``#`` should be defined from the top level.

If you want to use an anchor value from another file you can also do this::
    property:
        <<: filename.yml#*anchorname
