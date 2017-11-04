/
	Title: Prepare MDs for MkDocs build 
	Author: stephen@kx.com

	Where MDs have no H1 tag, MkDocs supplies one from the `pages` section of mkdocs.yml.
	Using this ensures that, with deliberate exceptions, page titles match the LHS navigation.

	However these default H1s are not made available to the Lunr search engine, which instead
	uses the first available H2 as a page title, introducing some confusion into search results.

	Where the MD has no H1 this preprocessor script inserts H1 from mkdocs.yml.
\

/ Retrieve page definitions 
p:{(first x?enlist"pages:") _ x}read0 `:mkdocs.yml	/ pages section
pp:{[x]
  s:trim x;
  s:(2*"- "~2#s)_s; 								/ lose leading dashes
  (s?"#")#s 									    / lose trailing comments
  } each p
pd:{x where x like\:"*: *"} pp						/ page definitions
hf:{([]h1:x 0;file:x 1)}flip ": " vs/: pd   		/ table of H1s and filepaths
(string count hf)," pages found"            		/ log # of pages

mt:{0=count trim x}                         		/ test for blank or empty string

hasH1:{[lines]
	l:{$[count x;((+/)(&\)mt each x)_x;()]}lines;	/ drop leading blank lines
	if[not count l;'`$"empty file"]; 				/ break on empty file
	("# "~2#lines 0) or "===="~4#(2#l)1				/ look for H1
	};

process:{[x]
	ff:`$":docs/",x`file;
	ll:read0 ff;
	if[not count ll;: ::];                          / ignore empty file
	fix:not hasH1 ll;
	if[fix; ff 0:("# ",x`h1;""),ll;];				/ insert h1
	0N!x[`file]," ",?[fix;"fixed";"has H1"];		/ log
	}

process each hf;

exit 0
