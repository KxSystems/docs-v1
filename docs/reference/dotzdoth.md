.z.h
====

Returns the host name as a symbol

    q).z.h
    `demo.kx.com

On linux this should return the same as the shell command 'hostname'. If you require a fully qualified domain name, and the hostname command returns a hostname only (with no domain name), this should be resolved by your system administrators. Often this can be traced to the ordering of entries in /etc/hosts, e.g.

Non-working /etc/host look like :

    127.0.0.1      localhost.localdomain localhost
    192.168.1.1  myhost.mydomain.com myhost

Working one has this ordering :

    127.0.0.1      localhost.localdomain localhost
    192.168.1.1  myhost myhost.mydomain.com

One solution seems to be to flip around the entries, i.e. so the entries should be

    ip hostname fqdn

A work around from within kdb+ is

    q).Q.host .z.a

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
