File handle zero is the console process.

Writing to it, executes a Q expression in the main thread:

`q)0 "1 \"hello\""`
`hello1`
`q)0 (+;2;2)`
`4`

Reading from it using [read0](Reference/read0 "wikilink"), permits interactive input.

`q)1">> ";a:read0 0`
`>> whatever`
`q)a[4+til 4]`
`"ever"`
