/
	Title: Prepare MDs for MkDocs build 
	Author: stephen@kx.com

	The Lunr search engine used by MkDocs highlights as page title the first H2 on each page.
	MkDocs displays each page with a default H1 from mkdocs.yml, but these H1s do not appear 
	in the Lunr search results. 

	Where the MD has no H1 this preprocessor inserts H1 from the YAML.
\

p:{x where x like\:"*: *"}{(2*"- "~2#x)_x}each trim each{(first x?enlist"pages:")_x}read0 `:mkdocs.yml;
hf:{([]h1:x 0;file:x 1)}flip ": " vs/: p;
0N!(string count hf)," pages found";

mt:{0=count trim x} / blank or empty string

hasH1:{[lines]
	l:{((+/)(&\)mt each x)_x}lines;			/ drop leading blank lines
	if[not count l;'`$"empty file"]; 		/ break on empty file
	("# "~2#lines 0) or "===="~4#(2#l)1		/ look for H1
	};

{[h1;file] 
	ff:`$":Docs/",file;
	ll:read0 ff;
	if[hasH1 ll;0N!file," has H1";:];
	ff 0:("# ",h1;""),ll);					/ insert h1
	0N!file," amended";
	}. each hf;
