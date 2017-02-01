.z.X
====

Available since kdb+ v3.3 2015.02.12

Returns a list of char vectors of the raw, unfiltered cmd line with which kdb+ was invoked, including the name under which q was invoked as well as single-letter arguments.

e.g.

`$ q somefile.q -customarg 42 -p localhost:17200`
`KDB+ 3.4 2016.09.22 Copyright (C) 1993-2016 Kx Systems`
`m64/ 4()core 8192MB ...`
`q).z.X`
`,"q"`
`"somefile.q"`
`"-customarg"`
`"42"`
`"-p"`
`"localhost:17200"`
