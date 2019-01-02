#!mammal -v aardvark
"""`characters` module: adds the used characters of mammal.

Many characters are used in mammal. But you are welcome
to add more in your packages. All of UTF8 is fair game.

Author:  Matthias B.
"""
# TODO: some of this is out of date, change to new syntax

import latin : !characters  # TODO: This exclamation mark is weird


with __characters__ as c:

    c.setDefaultGroups(["digit"])  # TODO: state function
    c.add("0", "zero")  # TODO: add HTML, LaTeX and Mammal escape sequences
    c.add("1", "one")
    c.add("2", "two")
    c.add("3", "three")
    c.add("4", "four")
    c.add("5", "five")
    c.add("6", "six")
    c.add("7", "seven")
    c.add("8", "eight")
    c.add("9", "nine")

    c.setDefaultGroups(["greek", "mathematics", "small"])
    c.add("α", "alpha")
    c.add("β", "beta")
    c.add("γ", "gamma")
    c.add("δ", "delta")
    c.add("ε", "epsilon")
    c.add("ζ", "zeta")
    c.add("η", "eta")
    c.add("θ", "theta")
    c.add("ι", "iota")
    c.add("κ", "kappa")
    c.add("λ", "lambda")
    c.add("μ", "mu")
    c.add("ν", "nu")
    c.add("ξ", "xi")
    # c.add("ο", "omicron")  # not supported as it looks like o
    c.add("π", "pi")
    c.add("ρ", "rho")
    # c.add("ς", "sigma_final")  # not used in mathematics
    c.add("σ", "sigma")
    c.add("τ", "tau")
    c.add("υ", "upsilon")
    c.add("φ", "phi")
    c.add("χ", "chi")
    c.add("ψ", "psi")
    c.add("ω", "omega")

    # c.add("ϐ", "beta_var")  # not used in mathematics
    c.add("ϕ", "phi_var")  # TODO: mark as variant
    c.add("ϑ", "theta_var")
    c.add("ϵ", "epsilon_var")

    c.setDefaultGroups(["greek", "mathematics", "capital"])
    c.add("Γ", "Gamma")  # TODO: Capital greek ones should be explicitly disallowed
    c.add("Δ", "Delta")
    c.add("Θ", "Theta")
    c.add("Λ", "Lambda")
    c.add("Ξ", "Xi")
    c.add("Π", "Pi")
    c.add("Σ", "Sigma")
    c.add("Φ", "Phi")
    c.add("Ψ", "Psi")
    c.add("Ω", "Omega")

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
    c.add("!", "exclamation", alt:=["exclamationMark"])
    c.add("?", "question", alt:=["questionMark"])
    c.add("@", "at")
    c.add("~", "tilde")
    c.add("∘", "circ")
    c.add("∇", "nabla")

    c.setDefaultGroups(["operator", "set"])
    c.add("∪", "union")
    c.add("∩", "intersect")

    c.setDefaultGroups(["operator", "comparison"])
    c.add("<", "lower")
    c.add("≤", "lowerEqual")
    c.add(">", "greater")
    c.add("≥", "greaterEqual")
    c.add("=", "equals", alt:=["equal"])
    c.add("≠", "notEqual")
    c.add("≈", "aprox")
    c.add("≡", "equiv")

    c.setDefaultGroups(["operator", "comparison", "set"])
    c.add("⊂", "subset")
    c.add("⊆", "subsetEqual")
    c.add("⊃", "superset")
    c.add("⊇", "supersetEqual")


    c.setDefaultGroups(["mathematics"])
    c.add("­∅", "emptySet")
    c.add("∞", "infinity", alt:=["lemniscate"])
    # c.add("⊥", "perpendicular")
    c.add("ℓ", "l_calig")
    # c.add("ℵ", "aleph")
    # c.add("∫", "integral")
    # c.add("√", "root")
    c.add("ℂ", "complexNumbers")  # Note: those are the math meanings not the character names
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
    c.add(")", "bracketClose")
    c.add("]", "squareBracketClose")
    c.add("}", "curlyBracketClose")

    c.setDefaultGroups(["separator"])
    c.add(" ", "space")
    c.add("\t", "tabulator", esc:="t")
    c.add("\n", "newline", esc:="n")
    c.add("…", "ellipsis")
    c.add(",", "comma")
    c.add(";", "semicolon")
    c.add(":", "colon")


    c.setDefaultGroups(["miscellaneous"])  # all need their own group probably
    c.add("_", "underscore")
    c.add("#", "hash")
    c.add("§", "paragraph", latex=r"\S")

    c.setDefaultGroups(["digits", "raised"])  # raised has to be handled specially
    c.add("⁰", "zero_raised")
    c.add("¹", "one_raised")
    c.add("²", "two_raised")
    c.add("³", "three_raised")
    c.add("⁴", "four_raised")
    c.add("⁵", "five_raised")
    c.add("⁶", "six_raised")
    c.add("⁷", "seven_raised")
    c.add("⁸", "eight_raised")
    c.add("⁹", "nine_raised")

    c.setDefaultGroups(["operator", "raised"])
    c.add("⁺", "plus_raised")
    c.add("⁻", "minus_raised")
