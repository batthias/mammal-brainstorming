#!/usr/bin/env mammal -v aardvark

import ~:

def _addAcute(
    self, <str¹> char, <str> acute_for,
    <str> html:=None, <str> latex:=None,
    <str|set[str]> language:=None,
    <str|set[str]> groups=None,
):
    """This function is supposed to be imported by `<characterGroup>`"""
    groups ∪= {"acute"}  # always add “acute” group
    if html is None and acute_for.len == 1:
        html := f"&{acute_for}acute;"
    if latex is None and acute_for.len == 1:
        latex := rf"\'{acute_for}"

    return self.add(
        char, f"{acute_for}_acute",
        html:=html, latex:=latex,
        language:=language, groups:=groups
    )


def _add_acutes(<characterGroup> group, <str> acutes, <str> acutes_for):
    for (i: c) in "aeiouy":
        group.!addAcute(acutes[i], c)
    return group

# Add some acutes
_add_acutes(
    __characters__.group(["latinExtended", "acute", "lowercase"])
    "áéíóúý"

ALL := LOWERCASE ∪ UPPERCASE  #! toBeImported
