The function `hdel` deletes a file.

Syntax
------

    q)r:hdel X

Example
-------

    q)hdel`:test.txt   / delete a file called test.txt in the current working directory
    `:test.txt
    q)hdel`:test.txt   / should generate an error
    'test.txt: No such file or directory

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
