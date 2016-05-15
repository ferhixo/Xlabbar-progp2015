[kattio].


main :- 
	read_int(_),
	repeat,
	read_string(S),
	(S == end_of_file ;
	 solve(S),
	 fail
	).

	
solve(X) :-
	setof(Count, move([], X, Count), AllCount),
	!,
	min_list(AllCount, LowCount),
	write(LowCount), nl.


move([], X,  Count) :-
	action([], X, Count).

action(ResList, [], Count) :- count(ResList, Count).

action(ResList, [111,111,45|Tail], Count) :-
	append(ResList, [45,45,111|Tail], NewResList),
	move([], NewResList, Count).


action(ResList, [45,111,111|Tail], Count) :-
	append(ResList, [111,45,45|Tail], NewResList),
	move([], NewResList, Count).

action(X, [H|Tail], Count) :-
	append(X, [H], NewX),
	action(NewX, Tail, Count).	 


count([], 0).
count([111|Tail], NewCount):- !, count(Tail, Count), NewCount is Count + 1.
count([_|Tail], Count) :- count(Tail, Count).
