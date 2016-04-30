[kattio].

main :-
    read_string(S),
    length(S, Length),
    spamhelp(S, Length, 0, 0, 0, 0, RW, RL, RU, RS),
    write(RW), nl,
    write(RL), nl,
    write(RU), nl,
    write(RS), nl,
    !.

spamhelp([], Len, NW, NL, NU, NS, RW, RL, RU, RS) :-
    RW is NW / Len,
    RL is NL / Len,
    RU is NU / Len,
    RS is NS / Len,
    !.

spamhelp([Head|Tail], Len, NW, NL, NU, NS, RW, RL, RU, RS) :- 
    (char_code('_', Head) -> spamhelp(Tail, Len, NW + 1, NL, NU, NS, RW, RL, RU, RS));
    (char_type(Head, lower) -> spamhelp(Tail, Len, NW, NL + 1, NU, NS, RW, RL, RU, RS));
    (char_type(Head, upper) -> spamhelp(Tail, Len, NW, NL, NU + 1, NS, RW, RL, RU, RS));
    spamhelp(Tail, Len, NW, NL, NU, NS + 1, RW, RL, RU, RS),
    !.