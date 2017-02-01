The `md5` function computes the MD5 (Message-Digest algorithm 5) of a string. MD5 is a widely used, Internet standard (RFC 1321), hash function that computes a 128-bit hash, that is commonly used to check the integrity of files. It is not recommended for serious cryptographic protection, for which strong hashes should be used.

Example
-------

    q)md5 "this is a not so secret message"
    0x6cf192c1938b79012c323fa30e62787e

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
