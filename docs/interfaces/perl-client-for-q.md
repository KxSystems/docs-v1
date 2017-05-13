<i class="fa fa-hand-o-right"></i> [cpan.org/~markpf/Kx-0.039/](http://search.cpan.org/~markpf/Kx-0.039/)

!!! note "From Mark Pfeiffer"
    So far:

    - `$k->cmd()` doesn’t handle keyed tables well. Use `$k->Tget()` then `$k->val` to get the underlying value as a Perl hash.
    - Use Kx-0.36: it is the most stable.

