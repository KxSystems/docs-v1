*Note: for the nonce, this is just the brief reference datatype list...*

    #!smallfont
    char-size--type-literal--------------q---------sql--------java-------.net---
    b    1     1    0b                   boolean              Boolean    boolean
    x    1     4    0x0                  byte                 Byte       byte
    h    2     5    0h                   short     smallint   Short      int16
    i    4     6    0i                   int       int        Integer    int32
    j    8     7    0j                   long      bigint     Long       int64
    e    4     8    0e                   real      real       Float      single
    f    8     9    0.0                  float     float      Double     double
    c    1     10   " "                  char                 Character  char
    s    .     11   `                    symbol    varchar    String     string
    p    8     12   dateDtimespan        timestamp
    m    4     13   2000.01m             month
    d    4     14   2000.01.01           date      date       Date
    z    8     15   dateTtime            datetime  timestamp  Timestamp  DateTime
    n    8     16   0D00:00:00.000000000 timespan
    u    4     17   00:00                minute
    v    4     18   00:00:00             second
    t    4     19   00:00:00.000         time      time       Time       TimeSpan
    *    4     20.. `s$`                 enum
               98                        table
               99                        dict
               100                       lambda
               101                       unary prim
               102                       binary prim
               103                       ternary(operator)
               104                       projection
               105                       composition
               106                       f'
               107                       f/
               108                       f\
               109                       f':
               110                       f/:
               111                       f\:
               112                       dynamic load

the nested types are 77+t (e.g. 78 is boolean. 96 is time.)

`char$data`CHAR$string

The int, float, char and symbol literal nulls are: 0N 0n " " `` `. `` The rest use type extensions, e.g. 0Nd. No null for boolean or byte. 0Wd 0Wz 0Wt placeholder infinite dates/times/datetimes (no math)

date.(year month week mm dd) dict:`a`b!.. table:(\[\]x:..;y:..) or +`x`y!.. time.(minute second mm ss) milliseconds=time mod 1000
