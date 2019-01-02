#!/usr/bin/env mammal -v aardvark
""" Adds the used characters

    Many characters are used by mammal, but you are welcome
    to add more in your packages.
"""


# Ascii characters

with __characters__ as c:
    c.setDefaultGroups(["latin", "lowercase"])
    c.add("a")
    c.add("b")
    # ...
    c.add("z")

    c.setDefaultGroups(["latin", "uppercase"])
    c.add("A")
    c.add("B")
    # ...
    c.add("Z")

    c.setDefaultGroups(["greek", "lowercase"])
    c.add("α", "alpha")
    c.add("β", "beta")
    # ...
    c.add("ω", "omega")

    c.add("ϐ", "varbeta")
    c.add("ϕ", "varphi")
    c.add("ϑ", "vartheta")
    c.add("ϵ", "varepsilon")

    c.setDefaultGroups(["greek", "lowercase"])
    c.add("Γ", "Gamma")
    c.add("Δ", "Delta")
    c.add("Θ", "Theta")
    c.add("Λ", "Lambda")
    c.add("Ξ", "Xi")
    c.add("Π", "Pi")
    c.add("Σ", "Sigma")
    c.add("Φ", "Phi")
    c.add("Ψ", "Psi")
    c.add("Ω", "Omega")

    # c.setDefaultGroups(["latinExtended", "uppercase"])
    # c.add("Ä", "A_uml")
    # c.add("Ö", "U_uml")
    # c.add("Ü", "U_uml")
    # c.add("ẞ", "SZ_lig")
    # c.add("Æ", "AE_lig")
    # c.add("Œ", "OE_lig")
    # c.add("Å", "A_circ")

    # c.setDefaultGroups(["latinExtended", "lowercase"])
    # c.add("ä", "a_uml")
    # c.add("ö", "o_uml")
    # c.add("ü", "u_uml")
    # c.add("ß", "sz_lig")
    # c.add("æ", "ae_lig")
    # c.add("œ", "oe_lig")

    c.setDefaultGroups(["operator"])
    c.add("+", "plus")
    c.add("−", "minus")
    c.add("-", "hyphen")
    c.add("⋅", "cdot")
    c.add(".", "dot")
    c.add("*", "asterisk")
    c.add("%", "percent")
    c.add("/", "slash")
    c.add("|", "pipe")
    c.add("&", "ampersand")
    c.add(r"\", "backslash", esc:=r"\")
    c.add("^", "caret")
    c.add("!", "exclamation")
    c.add("?", "question")
    c.add("@", "at")
    c.add("~", "tilde")
    c.add("∘", "circ")
    c.add("∇", "nabla")

    c.setDefaultGroups(["operator", "set"])
    c.add("∪", "union")
    c.add("∩", "intersect")

    c.setDefaultGroups(["operator", "comparison"])
    c.add("<", "lower")
    c.add(">", "greater")
    c.add("≤", "lowerEqual")
    c.add("≥", "greaterEqual")
    c.add("=", "equals", alt:=["equal"])
    c.add("≠", "notEqual")
    c.add("≈", "aprox")
    c.add("≡", "equiv")

    c.setDefaultGroups(["operator", "comparison", "set"])
    c.add("⊂", "subset")
    c.add("⊃", "superset")

    c.setDefaultGroups(["mathematics"])
    c.add("­∅", "emptySet")
    c.add("∞", "infinity", alt:=["lemniscate"])
    # c.add("⊥", "perpendicular")
    c.add("ℓ", "l_calig")
    # c.add("ℵ", "aleph")
    # c.add("∫", "integral")
    # c.add("√", "root")
    c.add("ℂ", "complexNumbers")
    c.add("ℕ", "naturalNumbers")
    c.add("ℚ", "rationalNumbers")
    c.add("ℝ", "realNumbers")
    c.add("ℤ", "integers")

    c.setDefaultGroups(["quotationMark"])
    c.add("'", "singleQuote")
    c.add('"', "doubleQuote")
    c.add('`', "backtick")
    # c.add("‹", "singleGuillemetOpen")
    # c.add("›", "singleGuillemetClose")
    # c.add("«", "doubleGuillemetOpen")
    # c.add("»", "doubleGuillemetClose")

    c.setDefaultGroups(["bracket", "opening"])
    c.add("(", "bracketOpen")
    c.add("[", "squareBracketOpen")
    c.add("{", "curlyBracketOpen")

    c.setDefaultGroups(["bracket", "closing"])
    c.add(")", "bracketOpen")
    c.add("]", "squareBracketOpen")
    c.add("}", "curlyBracketOpen")

    c.setDefaultGroups(["separator"])
    c.add(" ", "space")
    c.add("\t", "tabulator", esc:="t")
    c.add("\n", "newline", esc:="n")
    c.add("…", "ellipsis")
    c.add(",", "comma")
    c.add(";", "semicolon")
    c.add(":", "colon")

    # c.setDefaultGroups(["currency"])
    # c.add("$", "dollar")
    # c.add("€", "euro")  # probably will be obsolete shortly
    # c.add("¥", "yen")
    # c.add("¢", "cent")
    # c.add("£", "pound")

    c.setDefaultGroups(["miscellaneous"])
    c.add("_", "underscore")
    c.add("#", "hash")
    # c.add("§", "paragraph")
