Associations
------------

An association is a pair of lists in 1-1 relationship, that relates a set of keys to a set of values. It can be created with the verb ! as in `keys!values`. Any data types can be used in an association.

Dictionaries
------------

A dictionary is an association where the keys are a list of symbols. **Although not enforced, there should be no duplicate keys, as behaviour for operations on dictionaries with non-unique keys is undefined.** Note that vectors perform better than lists.

For example:

    q)items:`nut`bolt`cam`cog
    q)sales:6 8 0 3
    q)prices:10 20 15 20

    q)dkeys:`items`sales`prices         / list of keys
    q)dvals:(items;sales;prices)       / list of values
    q)dict:dkeys!dvals                 / dictionary
    q)dict
    items | nut bolt cam cog
    sales | 6   8    0   3
    prices| 10  20   15  20

A dictionary is indexed on its key, and not on its position:

    q)dict`sales
    6 8 0 3
    q)dict 1
    `type

A dictionary can be index assigned. If the index is not already a key, the assignment creates a new key:

    q)dict[`sales]:10 14 1 7             / assign sales
    q)dict[`sizes]:30 20 0 15            / assign new sizes
    q)dict
    items | nut bolt cam cog
    sales | 10 14 1 7
    prices| 10 20 15 20
    sizes | 30 20 0 15

Two dictionaries can be joined together. Items in the second dictionary either overwrite the first dictionary, or are appended to the first dictionary. Thus, the assignments above could be done with a single join:

    q)dict                               / original dictionary
    items | nut bolt cam cog
    sales | 6 8 0 3
    prices| 10 20 15 20

    q)dict2:`sales`sizes!(10 14 1 7;30 20 0 15)  / required changes
    q)dict2
    sales| 10 14 1 7
    sizes| 30 20 0 15

    q)dict,dict2                         / join
    items | nut bolt cam cog
    sales | 10 14 1 7
    prices| 10 20 15 20
    sizes | 30 20 0 15

Arithmetic and other operations can be performed on dictionaries. The operations are performed on the values, if necessary matching on keys. For example, to multiply all sales by a factor of 10:

    q)dicts:(enlist sales)!enlist 10    / need to enlist the atoms
    q)dicts
    sales| 10
    q)dict * dicts
    items | nut bolt cam cog
    sales | 60 80 0 30
    prices| 10 20 15 20

To delete an entry, use verb `_` (delete):

    q)dict _ `items
    sales | 10 14 1  7
    prices| 10 20 15 20
