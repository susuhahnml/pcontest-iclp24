node((X,Y)) :- cell(X,Y).
attr(node,(X,Y),width,"0.5") :- cell(X,Y).
attr(node,(X,Y),shape,square) :- cell(X,Y).
attr(node,(X,Y),style,filled) :- cell(X,Y).
attr(node,(X,Y),fillcolor,blue) :- cell(X,Y),visit(X,Y), not start(X,Y).
attr(node,(X,Y),fillcolor,green) :- cell(X,Y),start(X,Y).
attr(node,(X,Y),pos,@pos(X,Y)) :- cell(X,Y).
attr(node,(X,Y),label,C) :- reward(X,Y,C).

edge(((X1,Y1),(X2,Y2))):-adjecent(X1,Y1,X2,Y2).
attr(edge,((X1,Y1),(X2,Y2)),label,T):-adjecent(X1,Y1,X2,Y2),visit(X2,Y2,T).
attr(edge,((X1,Y1),(X2,Y2)),color,green):-fence(X1,Y1,X2,Y2).
