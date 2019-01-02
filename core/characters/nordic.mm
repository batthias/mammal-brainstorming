#!/usr/bin/env mammal -v aardvark
"""
## Adds characters needed for nordic languages

Currently supported languages include:
• Icelandic & Faroese (i.e. North Germanic languages)
• Danish, Swedish & Norwegian (i.e. Scandinavian languages)

"""
import ~.acutes: é,á,í,ó,ú,ý, É,Á,Í,Ó,Ú,Ý
import ~.tremmas: ö

# latin characters (a-z, A-Z) are supported by default
with __characters__.group({"latinExtended", "lowercase"}, language={"is","fo"}) as g:
    g.!add("ð", "eth", html:="&eth;", latex:=r"\dh")
    g.!add("þ", "thorn", html:="&thorn;" latex:=r"\th")
    c.!add("æ", "ae_lig", html:="&aelig;", latex:=r"\ae")
    c.!add("ö", "o_uml", html:="&ouml;", latex:=r'\"o')
    IS := c

    ACUTES := __characters__.group({"latinExtended", "acute"})

    c.setDefaultGroups({"latinExtended", "uppercase"})
    c.add("Ð", "Eth", html:="&ETH;", latex:=r"\DH")
    c.add("þ", "thorn", html:="&THORN;" latex:=r"\TH")
    c.add("Æ", "AE_lig", html:="&AElig;", latex:=r"\AE")
    c.add("Ö", "U_uml", html:="&Ouml;", latex:=r'\"O')

    c.addAcute("É", "E_acute")
    c.addAcute("Á", "A_acute")
    c.addAcute("Í", "I_acute")
    c.addAcute("Ó", "O_acute")
    c.addAcute("Ú", "U_acute")
    c.addAcute("Ý", "Y_acute")


with __characters__ as c:
    # latin characters (a-z, A-Z) are supported by default

    c.setDefaultGroups(["latinExtended", "small"])
    c.add("æ", "ae_lig", html:="&aelig;", latex:=r"\ae")
    c.add("ø", "o_slash", html:="&oslash;", latex:=r"\o")
    c.add("å", "a_ring", html:="&aring;", latex:=r"\aa")
    c.add("ä", "a_uml", html:="&auml;", latex:=r'\"a')
    c.add("ö", "o_uml", html:="&ouml;", latex:=r'\"o')

    c.setDefaultGroups(["latinExtended", "capital"])
    c.add("Æ", "AE_lig", html:="&AElig;", latex:=r"\AE")
    c.add("Ø", "O_slash", html:="&Oslash;", latex:=r"\O")
    c.add("Å", "A_ring", html:="&Aring;", latex:=r"\AA")
    c.add("Ä", "A_uml", html:="&Auml;", latex:=r'\"A')
    c.add("Ö", "U_uml", html:="&Ouml;", latex:=r'\"O')
