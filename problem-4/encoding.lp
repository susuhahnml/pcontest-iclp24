time(1..L):-length(L).
cell(1..W,1..H):-width(W), height(H).
1{start(X,Y):cell(X,Y)}1.
dir((0,1);(0,-1);(1,0);(-1,0)).
adjecent(X1,Y1,X2,Y2):-cell(X1,Y1),cell(X2,Y2),dir((DX,DY)),X1=X2+DX, Y1=Y2+DY.

visit(X,Y,1):-start(X,Y).
0{visit(X1, Y1,T+1):adjecent(X,Y, X1, Y1)}1:-visit(X,Y,T),time(T+1).
last_visited(X,Y,T):- visit(X,Y, T), not visit(_,_,T+1).
:- last_visited(X,Y, _), not start(X,Y).
:- visit(X, Y,T), visit(X,Y,T'), T'>T, T>1.

visit(X, Y):-visit(X,Y,T).
fence(X,Y,X1,Y1):-visit(X,Y,T),visit(X1,Y1,T+1).
% :- #count{1,(X,Y):visit(X,Y)}!=16.

% {fence(X,Y,X+1,Y)}.

% visit(X,Y):-.
% make sure is a cycle
% check length
% check budget
% calculate costs
% no negative values
% check budget:

cost(N) :- #sum{C,(X,Y) : visit(X,Y), cost(X,Y,C)}=N.
:- budget(N), cost(M), N<M.

% % no negative values

:- fence(X,Y,_,_),  reward(X,Y,C), C<0.

% % reward function

reward(N) :- #sum{C,(X,Y) : visit(X,Y), reward(X,Y,C)}=N.

profit(R-C) :- reward(R), cost(C).

#maximize { N : profit(N) }.
% #show profit/1.

reachable_by_edge(N,1..M) :- width(N), height(M).
reachable_by_edge(1,1..M) :- width(N), height(M).
reachable_by_edge(1..N,M) :- width(N), height(M).
reachable_by_edge(1..N,1) :- width(N), height(M).


reachable_by_edge(X, Y+1) :- cell(X,Y), cell(X,Y+1), not visit(X,Y), not visit(X,Y+1), reachable_by_edge(X,Y).
reachable_by_edge(X+1, Y) :- cell(X,Y), cell(X+1,Y1), not visit(X,Y), not visit(X+1,Y), reachable_by_edge(X,Y).
reachable_by_edge(X, Y-1) :- cell(X,Y), cell(X,Y+1), not visit(X,Y), not visit(X,Y-1), reachable_by_edge(X,Y).
reachable_by_edge(X-1, Y) :- cell(X,Y), cell(X-1,Y), not visit(X,Y), not visit(X-1,Y), reachable_by_edge(X,Y).

unreachable :- cell(X,Y), not reachable_by_edge(X,Y), not visit(X,Y).
:- not unreachable.
