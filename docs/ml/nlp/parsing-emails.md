---
---

# Parsing emails from a string format 


### `.nlp.email.i.parseMail`

_Parses an email in string format_

Syntax: `.nlp.email.i.parseMail x`

Where `x` is an email in a string format, returns a dictionary of the headers and content.

```q
q)table:.nlp.email.parseMail emailString
q)cols table 
`sender`to`date`subject`contentType`payload
```


