.Q.qp
=====

Returns 1b if given a partitioned table, 0b if given a splayed table, and 0 for anything else.

    q)\
      B
    +`time`sym`price`size!`B
      C
    +`sym`name!`:C/
      \
    q).Q.qp B
    1b
    q).Q.qp select from B
    0
    q).Q.qp C
    0b
