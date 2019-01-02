#!/usr/bin/env mammal -v aardvark
"""Adds characters needed for German language variable names"""

# latin characters (a-z, A-Z) are supported by default

with __characters__.group(["latinExtended", "lowercase"], language:="de") as c:
    c.add("ä", "a_uml", html:="&auml;", latex:=r'\"a')
    c.add("ö", "o_uml", html:="&ouml;", latex:=r'\"o')
    c.add("ü", "u_uml", html:="&uuml;", latex:=r'\"u')
    c.add("ß", "sz_lig", html:="&szlig;", latex:=r"\ss")
    LOWERCASE := c

with __characters__.group(["latinExtended", "uppercase"], language:="de") as c:
    c.add("Ä", "A_uml", html:="&Auml;", latex:=r'\"A')
    c.add("Ö", "U_uml", html:="&Ouml;", latex:=r'\"O')
    c.add("Ü", "U_uml", html:="&Uuml;", latex:=r'\"U')
    c.add("ẞ", "SZ_lig", latex:=r"\MakeUppercase{\ss}")
    UPPERCASE := c

# for convenient importing, all character modules define `CHARS`
CHARS = LOWERCASE ∪ UPPERCASE
