/
    Title: Search engine for code.kx.com
    Authors: mark@kx.com, stephen@kx.com

    Usage: /q srchr.q -p 5022
\

// LOAD DATA TABLES
DATAPATH: ":",(system "cd"),"/data/";
load `$DATAPATH,"pages";
load `$DATAPATH,"refs";
load `$DATAPATH,"refContent";
load `$DATAPATH,"generalContent";

/ lower-case descriptions for searching; list of tables
tttt:value each{[x] update descr:lower each description from x}each `refs`pages`refContent`generalContent

// SEARCHING

.hidden.displayResults:{[s; r]
// HTML page
    wr: "https://code.kx.com/q";  / web root
    head: .h.htac[`meta;;""] (`$("http-equiv";"content"))!("Content-Type";"text/html; charset=utf-8");
    head,: .h.htac[`link;;""] `rel`href!("shortcut icon";wr,"/img/favicon.ico");
    head,: .h.htac[`link;;""] `rel`type`href!("stylesheet"; "text/css"; wr,"/stylesheets/search.css");
    head,: .h.htac[`script;;""] `type`src!("text/javascript"; "https://code.jquery.com/jquery-3.1.1.min.js");
    / head,: .h.htac[`script;;""] `type`src!("text/javascript"; wr,"/scripts/search.js");
    head,: .h.htac[`script;;""] `type`src!("text/javascript"; wr,"/scripts/search.js");
    head,: .h.htac[`script;;""] `type`src!("text/javascript"; "https://www.google-analytics.com/analytics.js");
    head,: .h.htac[`script;;""] `type`src!("text/javascript"; "https://code.kx.com/scripts/googleanalytics.js");
    head,: .h.htac[`script;;""] `type`src!("text/javascript"; "https://tracker.mrpfd.com/tracker.js");
    head,: .h.htc[`title;] s," - search code.kx.com";
    niq: .h.htac[`img;;""] `alt`src!("Kx"; wr,"/img/kx.jpeg");  /Kx logo
    niq: .h.htac[`a; `href`title!(wr; "code.kx.com"); niq];     /link to code.kx.com
    niq: .h.htac[`div; (enlist`id)!enlist"kx-logo"; niq];       /enclosing div
    niq,: .h.htc[`label; "Search code.kx.com/q for"];
    niq,: .h.htac[`input; `id`type`value!("query"; "text"; s); ""];
    body: .h.htc[`form; niq];
//
    fmt: {[r]
        grps: {[x;y](2_string y; select from x where grp=y)}/:[r; distinct r`grp];
        .h.htac[`div;(enlist`id)!enlist"kxsearch-results-wrapper";] raze (.hidden.muag .) each grps
        };
    body,: $[count r; fmt r; .h.htc[`p;] "No results found"];
//  body:  $[count r; fmt r; .h.htc[`p;] "No results found"];
    kdb: .h.htac[`a; ; "kdb+"] `class`href`title!("kdb"; "https://kx.com"; "Kx: it's about time");
    body,: .h.htac[`p;;"Search powered by ",kdb] (enlist`class)!enlist"kx-search-colophon";
//  body,: .h.htac[`p;;"Search powered by kdb+"] (enlist`class)!enlist"colophon";
    "<!DOCTYPE html>\n",.h.htac[`html;(enlist`lang)!enlist"en";] raze .h.htc'[`head`body; (head;body)]
    };

.hidden.findExcerpt:{[s;d]
    / indexes of excerpt: within line of d on which s is found
    / begin up to 25 chars before and return up to 90 chars
    brk:where d="\n";
    if[ (d like s,"*") & not count brk; :0#0 ];              / topic only, no excerpt
    //o:$[ ((d?"\n")#d)like s,"*¶"; 1+first d?"¶"; 0 ];        / offset
    o:$[0=count brk; 0; first "¶"<>d brk[0]-2 1; 0; ((brk[0]-2)#d)like "[*]*"; 1+first brk; 0];  / offset
    fnd:{first y where y>=x}[o;d ss s];                      / avoid heading
    bgn:max(0;       fnd-25; {x+x>0}max brk where brk<fnd);
    end:min(count d; bgn+90;        min brk where brk>fnd);
    bgn + til end-bgn
    };

.hidden.muat:{[x] /mark up a tuple
    href: (enlist`href)!enlist x`url;
    ctx:(count"http://code.kx.com/q/") _ {(-1+x?"#")#x} x`url;      /context
    r: .h.htc[`dt;] .h.htac[`a; href; x`topic]," &ndash; ",ctx;
//  r,: .h.htac[`dd; ; x`url] (enlist`class)!enlist "href";         /url
    r, {?[x~""; ""; .h.htc[`dd;] y,x,y]}[x`excerpt; "&hellip;"]     /excerpt
   }; 

.hidden.murt:{[x] /mark up a reference tuple
    raze .h.htc[`li;] .h.htac[`a; (enlist`href)!enlist x`url; x`topic]
    }; 

.hidden.muag:{[grp; tbl] /mark up a group
    niq:$[grp~"Reference";.h.htc[`ul;](,/)(.hidden.murt')tbl;.h.htc[`dl;](,/)(.hidden.muat')tbl];
    .h.htc[`h2;{(first x),lower 1_ x}grp] , niq
    };

.hidden.srch:{[str]
    dbgSH::str;
    if[str~"";:0#refs];                                         /nothing to look for here
    s: ssr[str except "[]"; "[?*]"; {"[",x,"]"}];               /escape ?*
    
    / variations on search string
    voss:{(x;x," *";x,"*";"*",x,"*")}lower s;                   /exact match first - order is important

    r:(,/) 10 5 7 7 {(x&count y)#y}' distinct each (,/)each {[x;y] select from x where descr like y}/:\:[tttt;voss];
    dbgR0::r;
    
    / topic from refContent and generalContent
    r:update topic:@[ r`description; where r[`grp] in `$("3-Reference Content";"4-General Content"); {[x](first x?"¶")#x} ] from r;
    / excerpt that brackets first mention of s
    r:update excerpt: r[`description]@' s .hidden.findExcerpt/: r`descr from r;
    
    :dbgR1::select grp, topic, excerpt, url: 1_' url from r;
    };

//.hidden.unescape: {ssr/[x; ("%22";"%27";"%3C";"%3E"); "\"'<>"]}                /reverse HTTP escaping

// SET CALLBACKS
show "Connecting to logger";
LOGGR: hopen `:unix://5202;                                     /logger FIXME trap fail

.z.exit: {[x]
    hclose LOGGR;
    show "Shutting down searcher at ",string .z.p;
    };

.z.pg:{neg[.z.w]0N!"Go away from pg"};
.z.po:{neg[.z.w]0N!"Go away from po"};
.z.pp:{neg[.z.w]0N!"Go away from pp"};
.z.wo:{neg[.z.w]0N!"Go away from wo"};
.z.ws:{neg[.z.w]0N!"Go away from ws"};

// SPECIAL SEARCH CASES
subs: flip({count[x]#x}'')(
    ("and";  "&"); 
    ("or";   "|"); 
    ("<";    "less than"); 
    (">";    "greater than");
    ("\"";   "primitive datatypes");
    ("`";    "symbols");
    (":";    "assign");
    ("[";    "indexing");
    ("]";    "indexing");
    ("[]";   "indexing");
    ("{";    "lambda");
    ("}";    "lambda");
    ("{}";   "lambda")
    );
substitute:{(y,enlist z)@(x,enlist z)?z}[subs 0; subs 1;]; 

.z.ph: {[x]
    dbgx:: x;
    neg[LOGGR] x;                                               /async: log whatever it is
    if[not 2=count x; :.h.he .Q.s x];                           /malformed query, gtfo
    str: x[0];
    if["favicon.ico"~11#str; :.h.hn["404"; `text; str]];        /refuse request for favicon
    show dbgX:: x;
    iq: {x?"?"}str;
    if[not"?query="~7#iq _ str; :.h.he str];                    /not a query, gtfo
    dbgQ::qry: {?[x~1#"%"; x; .h.uh x]} (iq+7) _ str;           /search term - special case "%"
    dbgR::rslts: .hidden.srch substitute qry;
    uniq: select from rslts where {(x?x)=til count x} url;      /unique URLs
    .h.hy[`html;] .hidden.displayResults[qry; uniq]
//  .h.hy[`json;] .j.j uniq
    };

show "Started search engine at ",string .z.p;

\
