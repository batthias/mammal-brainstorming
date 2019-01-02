#!/usr/bin/env mammal -v aardvark


with __characters__ as c:
    c.setDefaultGroups(["currency"])
    c.add("$", "dollar")
    c.add("€", "euro")  # probably will be obsolete shortly
    c.add("¥", "yen")
    c.add("¢", "cent")
    c.add("£", "pound")
    c.add("₩", "won")
    c.add("฿", "baht")
