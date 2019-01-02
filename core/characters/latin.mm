#!/usr/bin/env mammal -v aardvark
""" Adds the used latin characters of mammal """


def __import_characters__(scope):
    """
    This is called whenever !characters is imported.
    Used to import the characters

    Properties:
        <scope>   scope into which you import
        <as_name> name as which you import the characters (including dots and so on)
    """
    with scope.__characters__ as c:
        c.setDefaultGroups(["latin", "small"])
        c.add("a")
        c.add("b")
        c.add("c")
        c.add("d")
        c.add("e")
        c.add("f")
        c.add("g")
        c.add("h")
        c.add("i")
        c.add("j")
        c.add("k")
        c.add("l")
        c.add("m")
        c.add("n")
        c.add("o")
        c.add("p")
        c.add("q")
        c.add("r")
        c.add("s")
        c.add("t")
        c.add("u")
        c.add("v")
        c.add("w")
        c.add("x")
        c.add("y")
        c.add("z")

        c.setDefaultGroups(["latin", "capital"])
        c.add("A")
        c.add("B")
        c.add("C")
        c.add("D")
        c.add("E")
        c.add("F")
        c.add("G")
        c.add("H")
        c.add("I")
        c.add("J")
        c.add("K")
        c.add("L")
        c.add("M")
        c.add("N")
        c.add("O")
        c.add("P")
        c.add("Q")
        c.add("R")
        c.add("S")
        c.add("T")
        c.add("U")
        c.add("V")
        c.add("W")
        c.add("X")
        c.add("Y")
        c.add("Z")
