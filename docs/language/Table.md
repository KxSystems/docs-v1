A *table* is a dictionary that has been flipped (transposed), and where the values of the dictionary must have the same length.

A *keyed table* is a dictionary of a pair of tables: the key table with the key columns, and the value table with the remaining columns.

Note that table and keyed table correspond to the usual meaning of table in SQL, where a keyed table in q corresponds to a SQL table with one or more primary key columns.

Note also that tables can be built directly from the underlying lists, for example:

    q)dict                                     / dict
    items | nut bolt cam cog
    sales | 6   8    0   3
    prices| 10  20   15  20

    q)flip dict                                / table
    items sales prices
    ------------------
    nut   6     10
    bolt  8     20
    cam   0     15
    cog   3     20

    q)ids                                      / another dict
    id| 2 3 5 7

    q)(flip ids)!flip dict                     / keyed table
    id| items sales prices
    --| ------------------
    2 | nut   6     10
    3 | bolt  8     20
    5 | cam   0     15
    7 | cog   3     20

Creating Tables
---------------

Tables can also be defined by specifying the columns in the form:

  
  
(\[c<sub>1</sub>:v<sub>1</sub>;...;c<sub>j</sub>:v<sub>j</sub>\]c<sub>j+1</sub>:v<sub>j+1</sub>;...;c<sub>n</sub>:v<sub>n</sub>)

Here c<sub>i</sub> are symbols with the column name, and v<sub>i</sub> the corresponding list of values. The square brackets are used to specify primary keys, and must be given even if there are no primary keys - the example shows a table with j primary keys, and n columns in total.

For example:

    q)dob:1979.06.21 1947.11.01 1961.05.14 1976.01.18
    q)sal:44350 63375 78900 36750
    q)nms:`anne`mary`david`beth    
    q)t:([name:nms]dob:dob;sal:sal)
    q)t
    name | dob        sal
    -----| ----------------
    anne | 1979.06.21 44350
    mary | 1947.11.01 63375
    david| 1961.05.14 78900
    beth | 1976.01.18 36750

Empty Tables
------------

A table can be defined with empty data. The data type of the column is set either when the table is first written, or as null values of a given type. For example:

    q)w:([]name:();dob:();sal:())    / empty columns with no types
    q)w
    name dob sal
    ------------
    q)insert[w;(anne;1979.06.21;44350)]
    ,0
    q)w
    name dob        sal
    ---------------------
    anne 1979.06.21 44350

Alternatively, initialize w with empties of given type:

    q)w:([]name:symbol$();dob:date$();sal:int$())

Table Information
-----------------

The `cols` function returns the column names of a table:

    q)cols t
    `name`dob`sal

The `meta` function returns information about a table:

    q)meta t
    c   | t f a
    ----| -----
    name| s
    dob | d
    sal | i

Here, the t column is type, f is foreign key, and a is attributes. Both f and a are empty for this table.
