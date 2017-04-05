## `views`

Syntax: `views[]`

Returns a sorted list of the views currently defined in the root namespace.
```q
q)w::b*10
q)v::2+a*3
q)views[]
`s#`v`w
```
<i class="fa fa-hand-o-right"></i> [Views tutorial](http://code.kx.com/wiki/Views), [`view`](metadata/#view)


## `.Q`

<table class="kx-compact" markdown="1">
<tr><td>[`.Q.k`](dotq/#qk-version)</td><td>Interpreter version number for which q.k has been written</td></tr>
<tr><td>[`.Q.w`](dotq/#qw-memory-stats)</td><td>Memory stats as a dictionary</td></tr>
<tr><td>[`.Q.x`](dotq/#qxnon-command-parameters)</td><td>Non-command parameters from the command line</td></tr>
</table>


## `.z`

<table class="kx-compact" markdown="1">
<tr><td>[`.z.a`](dotz/#za-ip-address)</td><td>current IP address</td><td>[`.z.b`](dotz/#zb-dependencies)</td><td>dependencies</td></tr>
<tr><td>[`.z.c`](dotz/#zc-cores)</td><td>number of cores</td><td>[`.z.f`](dotz/#zf-file)</td><td>name of q script</td></tr>
<tr><td>[`.z.h`](dotz/#zh-host)</td><td>name of host</td><td>[`.z.i`](dotz/#zi-pid)</td><td>PID</td></tr>
<tr><td>[`.z.k`](dotz/#zk-release-date)</td><td>release date</td><td>[`.z.K`](dotz/#zk-version)</td><td>version</td></tr>
<tr><td>[`.z.l`](dotz/#zl-license)</td><td>license</td><td>[`.z.n`](dotz/#zn-utc-timespan)</td><td>UTC timespan</td></tr>
<tr><td>[`.z.N`](dotz/#zn-local-timespan)</td><td>local timespan</td><td>[`.z.o`](dotz/#zo-os-version)</td><td>OS version</td></tr>
<tr><td>[`.z.p`](dotz/#zp-utc-timestamp)</td><td>UTC timestamp</td><td>[`.z.P`](dotz/#zp-local-timestamp)</td><td>local timestamp</td></tr>
<tr><td>[`.z.q`](dotz/#zq-quiet-mode)</td><td>quiet mode</td><td>[`.z.u`](dotz/#zu-user-id)</td><td>user ID</td></tr>
<tr><td>[`.z.X`](dotz/#zx-raw-command-line)</td><td>raw command line</td><td>[`.z.z`](dotz/#zz-utc-datetime)</td><td>UTC datetime</td></tr>
<tr><td>[`.z.Z`](dotz/#zn-local-datetime)</td><td>local datetime</td></tr>
</table>

<i class="fa fa-hand-o-right"></i> [`.z.t` `.z.T` `.z.d` `.z.D`](dotz/#zt-zt-zd-zd-timedate-shortcuts) (temporal shortcuts)



