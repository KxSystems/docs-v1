Read file
=========

`read0 file`

The `read0` function reads a text file, returning a list of lines. Lines are assumed delimited by either LF or CRLF, and the delimiters are removed.

Example
-------

    q)`:test.txt 0:("hello";"goodbye")  / write some text to a file
    q)read0`:test.txt
    ("hello";"goodbye")

    q)d:raze{read0(`:/tmp/data;x;100000)}each 100000*til 5 / read 500000 lines, chunks of (up to) 100000 at a time

Read line
=========

`read0 handle`

The `read0` function can read a line of text from a [handle](Reference/Number "wikilink"), or from the [console](Reference/Zero "wikilink").

Example
-------

    q)rl:{1">> ";read0 0}
    q)rl`
    >> xiskso
    "xiskso"

Read bytes
==========

`read0 (file; offset; length)`

The `read0` function can read bytes from a file.

    q)`:foo 0: enlist "hello world"
    q)read0 (`:foo;6;5)
    "world"

Starting with KDB+ 3.4 2016.05.31 read0 allows user to specify how many bytes to read from a fifo.

    q)h:hopen`$":fifo:///etc/redhat-release"
    q)read0(h;8)
    "Red Hat "
    q)read0(h;8)
    "Enterpri"

See also
--------

-   [read1](Reference/read1 "wikilink")
-   [hopen](Reference/hopen "wikilink")
-   [0:](Reference/ZeroColon "wikilink") - prepare/save/load text

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
