# Typography


## Q and kdb+

The language is _q_. The database, process and product are all known as _kdb+_. Although both are proper names, which are conventionally set with initial upper-case letters, they are both set in lower case except where they start sentences or headings. 


## Headings

Set headings eadings are set in sentence case, i.e., in lower case except for

-   the first letter
-   acronyms, e.g. _IPC_, _HTTP_, API
-   proper names, e.g. Python, C#, WebSocket, GitHub, macOS

Minimise punctuation within a heading and end it without punctuation. 

Number headings in an article only when there are many references in the text to the numbers. Where there are a few references to heading numbers, replace them with the italicised heading texts, linked to the headings. 


### Ordered and unordered lists

Use numbered lists only 

-   where it is necessary to refer to a list item, e.g. “as in (3) above”
-   where the order is significant, e.g. in a sequence of instructions 

In Markdown, where a list item spans multiple paragraphs, or includes a code block, use indentation to keep all the list item’s children subordinate to it. 

Where 

-   a list has no more than five items; 
-   its items are clauses of a single sentence;
-   and the sentence continues after the end of the list

suffix all but the last item with a semicolon, as in this sentence.





### Parentheses, endashes and emdashes

Parenthetical comments can be marked with endashes – like this – or (like this) marked off with parentheses. Do not finish a sentence with a parenthesised expression. Separate the last expression with an endash – it will look fine. Or finish the first sentence and start a new one. 

American typography uses an emdash without surrounding whitespace–like this–but we do not. 



## Markdown


### Code blocks

In Markdown files, use code fences, not indentation, to denote code blocks. Label the opening code fence with the code language. 

<pre><code class="language-markdown">
&#096;&#096;&#096;q
q)til 3
0 1 2
&#096;&#096;&#096;
</code></pre>


### Admonitions

Use admonitions for warnings, tips and notes.

!!! note "Example"
    This shows how it’s done.


