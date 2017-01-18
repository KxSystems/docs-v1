One can write a string vector to stdout using 1 and -1. The difference is that -1 appends a newline after the string, whereas 1 does not. Note: this expression has a return value of 1 or -1, respectively, which will print as well if not suppressed.

    q)1 "String vector here\n"
    String vector here
    1
    q)-1 "String vector here"    / equivalent
    String vector here
    -1

This is a special case of [send to handle](Reference/Number "wikilink").
