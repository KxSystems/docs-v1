.z.ac
=====

Http authenticate from cookie

Allows users to define custom code to extract Single Sign On (SSO) token cookies from the http header and verify it, decoding and returning the username, or instructing what action to take.

.z.ac is passed a single parameter, a 2 element list of ( requestText ; requestHeaderAsDictionary )

    q).z.ac:{mySSOAuthenticator x[1]`Authorization}

where allowed return values are

    (0;"") / return default 401
    (1;"username") / authenticated username (.z.u becomes this)
    (2;"response text") / send raw response text to client

and mySSOAuthenticator is your custom code that authenticates against your SSO library.

Note that if .z.ac is defined, .z.pw will NOT be called for http connections for authentication.

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
