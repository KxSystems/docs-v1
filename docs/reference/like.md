The verb `like` is the q pattern-matching primitive. Patterns in text are expressed by using certain reserved characters that have special meanings. The right argument is a character string holding the pattern. The left argument can be:

-   a symbol atom or vector
-   a char vector or list of char vectors
-   a dictionary whose value is a symbol vector, or list of char vectors.

The result is a boolean list indicating which items in the left argument match the pattern.

Syntax
------

    q)r:X like Y

Reserved Characters
-------------------

The reserved pattern-matching characters are "?", "\*", the pair "\[\]", and "`^`" in square brackets:

-   "?" matches an arbitrary character in the pattern
-   "\*" matches an arbitrary sequence of characters in the pattern
-   "\[\]" are used in pairs to list alternatives
-   "`^`" at the beginning of a list in brackets indicates characters that are *not* to be matched

To match the character '\[', embed the \[ inside \[\], i.e. \[\[\]

For example:

    q)a:("roam";"rome")
    q)a like "r?me"
    01b
    q)a like "ro*"
    11b
    q)a like "ro[ab]?"
    10b
    q)a like "ro[^ab]?"
    01b
    q)"a[c" like "a[[]c"
    1b

The same applies for the characters '\*', '?' and '^', i.e. \[\*\], \[?\] and \[^\].

    q)(`$("ab*c";"abcc"))like"ab[*]c"
    10b
    q)(`$("ab?c";"abcc"))like"ab[?]c"
    10b
    q)(`$("ab^c";"abcc"))like"ab[*^]c"
    10b

Example
-------

The left argument in the following example is a list of telephone book entries:

    q)tb
    "Smith John 101 N Broadway Elmsville 123-4567"
    "Smyth Barbara 27 Maple Ave Elmstwn 321-7654"
    "Smythe Ken 321-a Maple Avenue Elmstown 123-9999"
    "Smothers 11 Jordan Road Oakwood 123-2357"
    "Smith-Hawkins K Maple St Elmwood 321-832e"

    q)tb like "Smith*"
    10001b
    q)tb like "Sm?th*"
    11111b
    q)tb like "Sm[iy]th*"
    11101b

We can try finding everyone with the telephone exchange code 321 as follows:

    q)tb like "*321-*"
    01101b

Unfortunately, this pattern also picks up the item for Ken Smythe, who has "321-" as part of his address. Since the exchange code is part of a telephone number the "-" must be followed by a digit, which can be expressed by the pattern `"*321-[0123456789]*"`. There is a shorthand for long sequences of alternatives, which in this case is `"*321-[0-9]*"`.

    q)tb like "*321-[0-9]*"
    01001b

Other sequences for which this shorthand works are sequences of alphabetic characters (in alphabetic order). The pattern in the last example isn't foolproof. We would also have picked up Ken Smythe's item if his street number had been 321-1a instead of 321-a. Since the telephone number comes at the end of the text, we could repeat the above alternative four times and leave out the final "`*`", indicating that there are four digits are at the end of each item.

    q)tb like "*321-[0-9][0-9][0-9][0-9]"
    01000b

Unfortunately this pattern misses the last item, which has an error in the last position of the telephone number. However, in this case the simpler pattern `"*321-????"` will work. It is generally best to not over-specify the pattern constraint.

    q)tb like "*321-????"
    01001b

The reserved character "`^`" selects characters that are not among the specified alternatives. For example, there are errors in some items where the last position in the telephone number is not a digit. We can locate all those errors as follows.

    q)tb like "*[^0-9]"
    00001b

See also
--------

-   [ss](Reference/ss "wikilink")
-   [ssr](Reference/ssr "wikilink")
-   [Regex Cookbook](Cookbook/regex "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
