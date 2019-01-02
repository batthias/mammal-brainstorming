<int> var = 444
<str> name = 'Wunderbaum'

# Das wäre nicht definiert:
debug.add(var + name)
# Was versucht er daraus zu machen?
# 1. `debug` steht vor `.`, also gucken wir mal ob es dafür eine Variable im
#    aktuellen Namensraum ($) gibt. Das gibt es, da ist nämlich
#    `'$.debug':  $compiler.debug`   enthalten
# 2. `add` ist keine Funktion von `$.debug`, das wird also eine Exception werfen
# 3. `var + name` hat den Operator-Namen `+` zwischen zwei Bezeichnern
# 4. '+': {
#       $string.concatenate
#       $int.add
#       $float.add
#    }
#    Also guckt der Compiler ob davon irgendwas mit den vorhandenen Typen klar
#    kommt:  var ~= <int>, also
#  Wenn nicht wird noch nach dm$debug debug.print  `<int> + <str>` nicht definiert ist

# Zu Beginn kennt der Compiler nur zwei Funktionen:
import <name> to_import as <name> alias           # `as ...` ist optional
from <name> module import <name> as <name> alias  # `as ...` ist wieder optional

# Man importiert also als erstes mal ein par Standard-Language-Features:
import slf
# Damit existiert der Sub-Namespace `$slf`, den man nun nutzen kann.

#############################################
# Hier mal ein par Sachen aus Integer:
def `-` <int> a:  # Negatives der Zahl

def `+` <int> a:  # Positives der Zahl

def `!` <bool> a: # Negieren des Ergebnisses
    $slf.not(a)

# Da das alles recht wiederholend ist macht man sich da normalerweise eine
# assign-Funktion zu, und baut nur noch die Funktionen.

# So (oder so ähnlich) könnte dann eine Compilerklasse aussehen, die das
# ganze in Maschinencode übersetzen soll
def negative(<int> a):
    asm('NEG', a)
def positive(<int> a):
    asm(a)
def plus(<int> a, <int> b):
    asm('MOV', reg=free_add_register(), a)
    asm('ADD', reg, b)
def minus(<int> a, <int> b):
    asm('MOV', reg=free_add_register(), a)
    asm('SUB', reg, b)
def times(<int> a, <int> b):
    asm('MOV', reg=free_mul_register(), a)
    asm('MUL', reg, b)
def divide(<int> p, <int> q):
    asm('MOV', reg=free_mul_register(), p)
    asm('DIV', reg, q)


#############################################

def register_prefix_operators(<list> list):
    for name in list:
        $system.register_operator(name, 'UNARY_PREFIX')
# usw.


# Unter anderem sind da die Operatoren drin
use_namespace $slf.operator_functions:
    unary_operators = register_prefix_operators([
        '-':  negative,
        '+':  positive,
        '~':  invert,
        '*':  pack,
        '**': kpack,
        '@':  propertize,
    ])

    binary_operators = assign_binary_operators([
        '+':  plus,
        '-':  minus,
        '*':  times,
        '**': power,
        '/':  divide,
        '//': int_divide,
        '%':  modulo,
        ':':  slice,
    ])

    $slf.comparison_operators = [
        '==': equal,         # a == b  Ist a gleich b
        '!=': non_equal,     # a != b  Ist a ungleich b
        '<=': less_equal,    # a <= b  Ist a kleiner oder gleich b
        '>=': greater_equal, # a >= b  Ist a größer oder gleich b
        '>':  greater,       # a > b   Ist a größer als b
        '<':  less,          # a < b   Ist a kleiner als b
        '~=': approx_equal,  # a ~= b  Ist a ungefähr gleich b
    ]
    $slf.assignment_operators = [
        '=':  assign,
        '+=': plus_equal,
        '-=': minus_equal,
        '*=': times_equal,
        '**=': power_equal,
        '/=': slash_equal,
        '//=': slashslash_equal,
        '%=': modulo_equal,
        '|=': or_equal,
        '&=': and_equal,
        '^=': xor_equal,
        '@=': at_equal,
    ]
    $slf.logical_operators = [
        '&&':  and,
        '||':  or,
        '^^':  xor,
        '!':   not,  # @unary_prefix
    ]

    $slf.binary_operators = [
        '&': and,
        '|': or,
        '^': xor,
        '~': invert,  # @unary_prefix
        '<<': left_shift,
        '>>': right_shift,
    ]


$slf.unicode_operators = [
    '≤':  `<=`,
    '≥':  `>=`,
    '≠':  `!=`,
    '≈':  `~=`,
    '∈':  `in`,
    '!∈': `!in`,
    '⊂':  `s<`,   # Set-Less
    '⊆':  `s<=`,  # Set-LessEqual
    '⊃':  `s>`,   # Set-Greater
    '⊇':  `s>=`,  # Set-GreaterEqual
    '∪':  `union`,
    '∩':  `intersect`,
]

from loops import while


while condition:
    do something with something_else
