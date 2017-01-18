A verb takes two arguments and can be called with its arguments to left and right. A verb can also be called with the same syntax as functions, for example:

    q)2 3 5 + 10
    12 13 15

    q)+[2 3 5;10]
    12 13 15

If only the left argument is given, the result is a function of one argument:

    q)f:2 3 5 +
    q)f 10
    12 13 15

Several verbs are defined by the q system. A new verb can be defined only by applying an adverb to an existing verb, i.e. you cannot define a verb using explicit definition or function projection.

See also
--------

-   [Functions](Reference/Function "wikilink")
-   [Adverbs](Reference/Adverb "wikilink")

