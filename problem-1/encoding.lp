operation(unary,1,0,1).
operation(unary,1,1,0).
operation(unary,0,0,0).
operation(unary,0,1,1).

operation(binary,1,1,0,1).
operation(binary,1,0,1,1).
operation(binary,1,0,0,0).
operation(binary,1,1,1,1).
operation(binary,0,1,0,0).
operation(binary,0,0,1,0).
operation(binary,0,0,0,0).
operation(binary,0,1,1,1).

gate(G):-unary(G).
gate(G):-binary(G).
1{function(G,(1;0))}1:-gate(G).


value_aux(E,O,V):-entry(E,O,V).
value_aux(E,O,V_OUT):-
    output(G,O),
    input(G, _, O1),
    value_aux(E,O1,V_IN1),
    function(G, GV),
    unary(G),
    operation(unary, GV, V_IN1, V_OUT).
value_aux(E,O,V_OUT):-
    output(G,O),
    input(G, 1, O1),
    value_aux(E,O1,V_IN1),
    input(G, 2, O2),
    value_aux(E,O2,V_IN2),
    function(G, GV),
    binary(G),
    operation(binary, GV, V_IN1, V_IN2, V_OUT).

:- result(O), value_aux(E,O,V), value(E,O,V'), V!=V'.

#show function/2.
