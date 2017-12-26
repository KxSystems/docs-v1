\l py.k
bs:.P.fun[`bs4]`BeautifulSoup;

masterroot:`:http://code.kx.com/q/;

 / build page table
buildPages:{[]
    s:bs[.Q.hg masterroot;"html.parser"];
    l:.P.methd[s;`find_all;(enlist`class_)!enlist"md-nav__link"]1#"a";
    pages:flip (`description`url)!flip {x{.P.GET .P.ITEM[x]y}'`title`href}each .P.SEQ l;
    /pages:update description:lower description, url:{(string masterroot), x} each url, grp:`$"2-Section" from pages;
    pages:update url:{(string masterroot), x} each url, grp:`$"2-Section" from pages;
    :pages;
    };

buildReferences:{[x]
    root::`$x;
    0N!"Extracting ",string root;
    s:bs[.Q.hg root;"html.parser"];
    t:.P.REPR .P.methd[s;`find_all;(enlist`class_)!enlist"md-nav--secondary"]"nav";
    s:bs[t;"html.parser"];
    l:.P.methd[s;`find_all;(enlist`class_)!enlist"md-nav__link"]1#"a";
    reference:flip (`description`url)!flip {x{.P.GET .P.ITEM[x]y}'`title`href}each .P.SEQ l;
    reference:update url:{(string root),x} each url from reference;
    :reference;
    };

getContent:{[pageurl]    / pg is the page to get, must be from reference
    0N!"Extracting content ", pageurl;         / needs more debugging, cause this gon fail.
    pg:.Q.hg `$pageurl;
    headers:ss[pg;"<h2"];     / find all the h2 tags
    r:{[pg;pageurl;headpos]
        text:headpos _ pg; / cut off the required.
        textend:min first each (ss[text;"<h2"] except 0;count text;first ss[text;"</article"]);        / find the end point, if one exists
        text:textend#text;          / cut off the end
        s:bs[text;"html.parser"];   / send to soup
        headerlink:.P.methd[s;`find_all;(enlist`class_)!enlist"headerlink"]1#"a";
        header:{x{.P.GET .P.ITEM[x]y}'`href}first .P.SEQ headerlink;                / find out which tag this is. NO ERROR CHECKING!! SHOULD BE!
        /content:lower .P.GET .P.meth[s;`get_text]"";  / extract the textual aspects (would be nice to get rid of pre at this point)
        content:.P.GET .P.meth[s;`get_text]"";  / extract the textual aspects (would be nice to get rid of pre at this point)
        :((pageurl,header);content);
        } [pg;pageurl] each headers;
    :r;
    };

buildAll:{[]
    pages::buildPages[];
    refs::raze buildReferences each exec url from pages where url like "*/q/ref/*";
    refs::distinct refs;
    /refs::update description:lower description, grp:`$"1-Reference" from refs;
    refs::update grp:`$"1-Reference" from refs;
    results:raze getContent each exec url from pages where url like "*/q/ref/*";
    refContent::update grp:`$"3-Reference Content" from flip (`description`url)!(results[;1];results[;0]);
    refContent::delete from refContent where url like "*/q/ref/card/*";
    results2:raze getContent each exec url from pages where not url like "*/q/ref/*";
    generalContent::update grp:`$"4-General Content" from flip (`description`url)!(results2[;1];results2[;0]);
    save `:/Users/sjt/Data/kx/search/pages;
    save `:/Users/sjt/Data/kx/search/refs;
    save `:/Users/sjt/Data/kx/search/refContent;
    save `:/Users/sjt/Data/kx/search/generalContent;
    0N!"finished!";
    };

buildAll[];
exit 0

 /untrapped - functional select
 / compound column
 / 
/

 / only works on console
\l py.k
bs:.P.fun[`bs4]`BeautifulSoup
s:bs[.Q.hg`:http://code.kx.com/q/;"html.parser"]
l:.P.meth[s;`find_all]1#"a"
.P.GET{.P.ATTR[x]`$"__dict__"}first .P.SEQ l
