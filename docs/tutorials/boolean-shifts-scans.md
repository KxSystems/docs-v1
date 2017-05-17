## Shifts

One and previous is one
```q
(&amp;)prior x
```
One and previous is zero
```q
(>)prior x
```
Zero and previous is one
```q
(<)prior x
```
Zero and previous is zero
```q
not (|)prior x
```
Previous bit is different
```q
differ x
```
Previous bit is same
```
not differ x
```


## Scans

<!-- FIXME following examples all in undocumented k -->

Ones until first zero from left
```q
k)&amp;\x
mins x
```
Ones after first zero from left
```q
k)~&amp;\x
not mins x
```
Zeros until first one from left
```q
k)|\x
maxs x
```
Zeros after first one from left
```q
k)~|\x
not maxs x
```
Ones until first zero from right
```q
k)|&amp;\|x
reverse mins reverse x
```
Ones after first zero from right
```q
k)|~&amp;\|x
reverse not mins reverse x
```
Zeros until first one from right
```q
k)||\|x
reverse maxs reverse x
```
Zeros after first one from right
```q
k)|~|\|x
reverse not maxs reverse x
```
Boolean finite-state machine (switch state on 0)
```q
k)(=)\x
(=)scan x
```
Ones and ones between ones
```q
k)x|(~=)\x
x or(<>)scan x
```
Ones between ones
```
k)(~x)&amp;(~=)\x
(not x)and(<>)scan x
```