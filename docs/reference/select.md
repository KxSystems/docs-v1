Select retrieves specified columns from a table. It has many forms; not all are described here. In general, it is:

    select columns by groups from table where filters

To limit the returned results you can use any of these:

    select[n]
    select[m n]
    select[order]
    select[n;order]

n is the number of rows you wish to return (use negative n for getting from the back as in [Take](Reference/NumberSign "wikilink")). m is the row number you wish to start with. This is useful for stepping through query results one block of n at a time. order is a column (or table) and direction to order the results by; use &lt; for ascending and &gt; for descending. For example

    select[3;>price] from bids where sym=s,size>0

This would return the three best prices for symbol s with a size greater than 0.

Note: This construct works on in-memory tables but not on memory mapped tables that are loaded from splayed or partitioned files. Another technique for limiting results from partitioned tables is to apply an additional final constraint

    select...where..,(n&amp;count i)#1b

which limits the results to n per partition.

Performance characteristic: select\[n\] applies the "where" clause on all rows of the table, and takes the first n rows, before applying the "select" clause. Hence, if you are doing paging, it is better to store the result of the query somewhere and select\[n,m\] from there instead of running the filter again.

Quick Performance Tips
----------------------

:\#Select only the columns which you will use.

:\#Use the most restrictive constraint first.

:\#Ensure you have a suitable attribute on the first non-virtual constraint (e.g. \`p or \`g on sym)

:\#Constraints should have the unmodified column name on the lhs of the constraint operator (e.g. where sym in syms,...)

:\#When aggregating, use the virtual field first in the by clause. (e.g. select .. by date,sym from …)

Multithreading
--------------

Since v3.2 2014.05.02, the following pattern will make use of slave threads via peach

     select .. by sym,.. from t where sym in ...,.. when sym has a `g or `p attribute.

It uses peach for both in mem and on disk tables. For single-threaded, this is approx 6x faster in mem, 2x faster on disk, and uses less memory than previous releases - but mileage will vary. This is also applicable for partitioned db's as

    select .. by sym,.. from t where date ..,sym in ..,..

Special functions within select
-------------------------------

The following functions receive special treatment within select

count,first,last,sum,prd,min,max,med,avg,wsum,wavg,var,dev,cov,cor

(essentially .Q.a0 in q.k)

When used explicitly, such that kdb+ can recognize the usage, kdb+ will perform additional steps, such as enlisting results or aggregating across partitions. However, when wrapped inside another function, kdb+ does not know that it needs to perform these additional steps, and it is then left to the programmer to insert them.

e.g.

    q)select sum a from ([]a:1 2 3)
    a
    -
    6
    q)select {(),sum x}a from ([]a:1 2 3)
    a
    -
    6

scope
-----

*In what places are the local variables masked?*

When compiling functions, the implicit args x,y,z are visible to the compiler only when they are not inside the select, by and where clauses. The from clause is not masked. This can be observed by taking the value of the function and observing the first element (args).

    q)value{} / no explicit args, so x is a default implicit arg of identity (::)
    0x100001
    ,`x
    `symbol$()
    ,`
    "{}"

    q)value{select from y where a=x,b=z} / from clause is not masked, y is detected as an implicit arg here
    0x0ba0a179a20a040005
    `x`y
    `symbol$()
    ,`
    0b
    ((=;`a;`x);(=;`b;`z))
    ?
    "{select from y where a=x,b=z}"

    q)value{[x;y;z]select from y where a=x,b=z} / x,y,z are now explicit args
    0x0ba0a179a20a040005
    `x`y`z
    `symbol$()
    ,`
    0b
    ((=;`a;`x);(=;`b;`z))
    ?
    "{[x;y;z]select from y where a=x,b=z}"


    q){select from ([]a:0 1;b:2 3) where a=x,b=y}[0;2] / call with wrong number of args results in rank error
    'rank

    q){[x;y]select from ([]a:0 1;b:2 3) where a=x,b=y}[0;2] / works with explicit args
    a b
    ---
    0 2

select is

?\[t;c;b;a\]

t is a table.

(c;b;a) are all parse expressions executed in the context of t

Functional form of select can take a fifth or sixth parameter too. ?\[t;c;b;a;n \[m\]; order\]

`..` `where` `` `g=,`s `` `within` `..`
---------------------------------------

maybe rare to get much speedup,but if the `` `g `` goes to 100,000 and then `` `s `` is 1 hour of 24 you might see some overall improvement (with overall table of 30million)
