File handles are integers, file descriptors created with [hopen](Reference/hopen "wikilink") or callback numbers created [using a shared library](Cookbook/InterfacingWithC#Callbacks "wikilink").

If the file handle is a callback, then this executes [the callback](Cookbook/InterfacingWithC#Callbacks "wikilink").

If the file handle points to an actual file, then this \*writes\* to the file.

`` q)a:hopen`:file.txt ``
`q)a "first "`
`q)a "word\n"`
`q)hclose a`

If the file handle is negative and points to an actual file, then a newline is included:

`` q)a:hopen`:file.txt ``
`q)neg[a] "first line"`
`q)neg[a] "second line"`
`q)hclose a`

If the file handle is zero (\`0\`) then this writes to the [console](Reference/Zero "wikilink").
