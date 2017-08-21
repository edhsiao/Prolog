%Questao 3
concatena([],L,L).
concatena([H|L1],L2,[H|L3]):-concatena(L1,L2,L3).

invertido([],[]). 
invertido([H],[H]).
invertido([H|T],L):-invertido(T,L), concatena(T,Y,[H|L]).

invertido2(X,Y):-invertido2(X,Y,[]).
invertido2([X|T],Y,Z):-invertido2(Y,[X|Z],T).

invertido3(X,X):- reverse(X,X).
palindromo(X):- invertido3(X,X).
