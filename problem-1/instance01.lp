variable(x1).
variable(x2).
variable(x3).
unary(g1).
binary(g2).
unary(g3).
binary(g4).
input(g1,1,x1).
output(g1,o1).
input(g2,1,o1).
input(g2,2,x2).
output(g2,o2).
input(g3,1,o2).
output(g3,o3).
input(g4,1,o3).
input(g4,2,x3).
output(g4,o4).
result(o4).
entry(1,x1,0).
entry(1,x2,0).
entry(1,x3,0).
value(1,o4,1).
entry(2,x1,0).
entry(2,x2,1).
entry(2,x3,0).
value(2,o4,0).
entry(3,x1,1).
entry(3,x2,1).
entry(3,x3,0).
value(3,o4,0).
entry(4,x1,1).
entry(4,x2,0).
entry(4,x3,1).
value(4,o4,1).

% function(g1,0). function(g2,1). function(g3,1). function(g4,1).
% function([(g1,0), (g2,1), (g3,1), (g4,1)]).
