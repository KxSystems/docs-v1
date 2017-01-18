The `read1` function reads a file as a list of bytes.

Optionally, `read1` can take a three-item list as its argument, containing the file handle, an offset at which to begin reading, and a length to read.

Example
-------

    q)`:test.txt 0:("hello";"goodbye")      / write some text to a file
    q)read1`:test.txt                       / read in as bytes
    0x68656c6c6f0a676f6f646279650a
    q)"c"$read1`:test.txt                   / convert from bytes to char
    "hello\ngoodbye\n"

    q)d:raze{read1(`:/tmp/data;x;100000)}each 100000*til 5 / read 500000 lines, chunks of (up to) 100000 at a time

in version 3.4 you can specify how many bytes to read from fifo.

    q)h:hopen`$":fifo:///etc/redhat-release"
    q)"c"$read1(h;8)
    "Red Hat "
    q)"c"$read1(h;8)
    "Enterpri"

See also
--------

-   [read0](Reference/read0 "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
