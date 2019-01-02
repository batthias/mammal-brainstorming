#!/usr/bin/env mammal -v aardvark
"""
Tests whether the language features are correctly implemented
"""

import theorems: *TESTING  # do some testing

import .operators: <operatorManager>, <keywordManager>
import .environments: <environment>, <environmentManager>
import .names: <nameManager>


theorem "Magic variables are defined":
    """Let us see whether all the variables we need are really defined:"""
    def test_namings:
        """Test the operator support:"""
        assert __operators__ in <operatorManager>
        assert __operators__.keywords in <keywordManager>
        assert `in` in __operators__.keywords
        """Test whether some environments exist:"""
        assert __environments__ in <environmentManager>
        with __environments__ as env:
            assert (
                env['code'],
                env['type'],
                env['string'],
                env['annotation'],
                env['comment'],
            ) in <tuple[environment]>
        """Test whether names have their magic word:"""
        assert __names__ in <nameManager>
        assert `__names__` in __names__
