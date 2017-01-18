Syntax
------

The `do` statement has the form:

  
do\[count;exp<sub>1</sub>;...;exp<sub>n</sub>\]

where count must evaluate to an integer. The remaining expressions are run in order, count times.

`do` does not return a result.

Example
-------

Continued fraction for pi, for 7 steps:

    q)r:()
    q)t:2*asin 1
    q)do[7;r,:q:floor t;t:reciprocal t-q]
    q)r
    3 7 15 1 292 1 1

`do` can be used for accurate timing of expressions, e.g. time log of first 100,000 numbers, over 100 trials:

    q)\t do[100;log til 100000]
    396

See also
--------

-   [if](Reference/if "wikilink")
-   [if-else](Reference/DollarSign "wikilink")
-   [while](Reference/while "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
