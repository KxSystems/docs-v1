.z.ph (port httpget)
--------------------

called when a synchronous http request comes into the kdb+ session.

.z.ph is passed a single parameter, a 2 element list of `(` `requestText` `;` `requestHeaderAsDictionary` `)`

requestText is parsed in .z.ph - detecting special cases like requests for csv, xls output and the result is returned to the calling task.

requestHeaderAsDictionary contains information like the user-agent and can be used to return content optimised for particular browsers

    q)\c 43 75
    q).last.ph
        | ::
    when| 2007.08.16T12:20:32.681
    u   | `
    w   | 5
    a   | 2130706433
    x   | k){$[~#x:uh x:$[@x;x;*x];fram[$.z.f;x]("?";"?",*x:$."\\v");"?"=*x;..
    y   | (,"?";`Accept-Language`Accept-Encoding`Cookie`Referer`User-Agent`A..
    r   | "<html><head><style>a{text-decoration:none}a:link{color:024C7E}a:v..
    q).last.ph.y
    ,"?"
    `Accept-Language`Accept-Encoding`Cookie`Referer`User-Agent`Accept`Connec..
    q).last.ph.y 0
    ,"?"
    q).last.ph.y 1
    Accept-Language| "en-us"
    Accept-Encoding| "gzip, deflate"
    Cookie         | "defaultsymbol=AAPL"
    Referer        | "http://localhost:5001/"
    User-Agent     | "Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-us) Appl..
    Accept         | "text/xml,application/xml,application/xhtml+xml,text/ht..
    Connection     | "keep-alive"
    Host           | "localhost:5001"
    q)

See also
--------

-   [.z.pp](Reference/dotzdotpp "wikilink")
-   [.h](Doth "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
