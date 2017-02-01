joins
=====

A join combines data from two tables, or from a table and a dictionary.

Some joins are *keyed*, in that columns in the first argument are matched with the key columns of the second argument.

Some joins are *asof*, where a time column in the first argument specifies corresponding intervals in a time column of the second argument. Such joins are not keyed.

In each case, the result has the merge of columns from both arguments. Where necessary, rows are filled with nulls or zeroes.

non-asof joins
--------------

|          |          |
|----------|----------|
| **join** | **name** |
| ej       | equi     |
| ij       | inner    |
| lj       | left     |
| pj       | plus     |
| uj       | union    |
| upsert   | upsert   |

[ej](Reference/ej "wikilink") is similar to `ij`, where the columns to be matched are given as a parameter.

[ij](Reference/ij "wikilink") joins on the key columns of the second table. The result has one row for each row of the first table that matches the key columns of the second table.

[lj](Reference/lj "wikilink") joins on the key columns of the second table. The result has one row for each row of the first table. Null values are used where a row of the first table has no match in the second table. This is now built-in to `,\:`, see [below](Reference/joins#.2C_.28comma.29 "wikilink").

[pj](Reference/pj "wikilink") is a variation on left join. For each matching row, values from the second table are added to the first table, instead of replacing values from the first table.

[uj](Reference/uj "wikilink") uses all rows from both tables. If the second table is not keyed, the result is the catenation of the two tables. Otherwise, the result is the left join of the tables, catenated with the unmatched rows of the second table.

[upsert](Reference/upsert "wikilink") can be used to join two tables with matching columns (as well as add new records to a table). If the first table is keyed, any records that match on key are updated. The remaining records are appended.

asof joins
----------

In each case, the time column in the first argument specifies \[) intervals in the second argument.

|          |          |
|----------|----------|
| **join** | **name** |
| asof     | asof     |
| aj,aj0   | asof     |
| wj,wj1   | window   |

[wj, wj1](Reference/wj "wikilink") are the most general forms of asof join. Function parameters aggregate values in the time intervals of the second table. In `wj`, prevailing values on entry to each interval are considered. In `wj1`, only values occuring within each interval are considered.

[aj,aj0](Reference/aj "wikilink") are simpler window joins where only the last value in each interval is used. In the `aj` result, the time column is from the first table, while in the `aj0` result, the time column is from the second table.

[asof](Reference/asof "wikilink") is a simpler `aj` where all columns (or dictionary keys) of the second argument are used in the join.

, (comma)
---------

The comma verb also does joins. For tables t1 and t2:

::\* `t1,t2` does `t1` `upsert` `t2`

::\* `t1,'t2` joins records to records

::\* `t1,\:t2` does `t1` `lj` `t2` (since kdb 2.7 2011.01.24)

See also
--------

-   [,](Reference/Comma "wikilink")
-   [ej](Reference/ej "wikilink"), [ij](Reference/ij "wikilink"), [lj](Reference/lj "wikilink"), [pj](Reference/pj "wikilink"), [uj](Reference/uj "wikilink"), [upsert](Reference/upsert "wikilink")
-   [asof](Reference/asof "wikilink"), [aj](Reference/aj "wikilink"), [wj](Reference/wj "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

<Category:Joins>
