One can write a string vector to stderr using 2 and -2. The difference is that -2 appends a newline after the string, whereas 2 does not. Note: this expression has a return value of 2 or -2, respectively, which will print as well (to stdout) if not suppressed.

    q)2 "String vector here\n"
    String vector here
    2
    q)-2 "String vector here"    / equivalent
    String vector here
    -2

This is a special case of [send to handle](Reference/Number "wikilink").
