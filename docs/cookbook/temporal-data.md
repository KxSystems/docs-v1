In traditional RDMSs temporal changes in data are often represented by adding valid-time-interval information to each relationship, usually achieved by adding start and end columns to the relational tables. This approach is often wasteful because in many cases the end of each interval is the start of the next leading to a lot of repetition. Q offers a better alternative. Recall that adding an `` `s `` attribute to a dictionary makes it behave as a step function.

Compare
```q
q)d:(10*til 10)!til 10
q)d 5 10 15
0N 1 0N
```
and
```q
q)s:`s#d
q)s 5 10 15
0 1 1
```
Since keyed tables in q are a special case of a dictionary, adding an `` `s `` attribute to a keyed table has similar effect. For example, consider a table that records changes in a phone book:
```q
q)show ph
name date      | phone
---------------| -----
Bill 2000.01.01| 4444
John 2000.01.01| 5555
John 2000.06.10| 4444
```
Without an `` `s `` attribute, this table will readily produce for example John’s phone number on the date of the change, but any other date will produce an `0N`.
```q
q)show ph ((`John;2000.01.01);(`John;2000.03.01);(`John;2000.06.10))
phone
-----
5555

4444
```
Adding the attribute will change the result to
```q
q)ph:`s#ph
q)show ph ((`John;2000.01.01);(`John;2000.03.01);(`John;2000.06.10))
phone
-----
5555
5555
4444
```

!!! warning "Upsert into a stepped dictionary"
    If you try to upsert into a dict flagged as stepped, a `'step` error will be signalled.
    <pre><code class="language-q">
    q)d:`s#`a`b!1 2;
    q)`d upsert `c`d!3 4
    'step
    </code></pre>
    To update such a dict, remove the `` `s`` attribute, upsert, and add the `` `s`` attribute again.

Such tables can be used with `lj`:
```q
q)show x
name date      | x
---------------| -
John 2000.06.08| 0
John 2000.06.09| 1
John 2000.06.10| 2
John 2000.06.11| 3
John 2000.06.12| 4
q)show x lj ph
name date      | x phone
---------------| -------
John 2000.06.08| 0 5555
John 2000.06.09| 1 5555
John 2000.06.10| 2 4444
John 2000.06.11| 3 4444
John 2000.06.12| 4 4444
```

