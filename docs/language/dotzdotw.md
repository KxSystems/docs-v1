new feature in 2.5 2008.12.31

.z.W returns a dictionary of ipc handles with the number of bytes waiting in their output queues.

In 2.6 this was changed to a list of bytes per handle, see [Release Notes](Releases/ChangesIn2.6 "wikilink")

e.g.

    q)h:hopen ...
    q)h
    3
    q)neg[h]({};til 1000000); neg[h]({};til 10); .z.W
    3| 4000030 70
    q)sum each .z.W
    3| 0
