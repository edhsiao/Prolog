crescente([_]).
crescente([X|[Y|Z]]):- Y > X, crescente([Y|Z]).


filme(1,'monty').
filme(2,'senhor').
filme(3,'gata').

locacao(1,500).
locacao(2,1000).
locacao(3,100).

arrecadacao(F,V):-filme(X,F), locacao(X,Y),V is Y*5.

/*mulher(ana).
mulher(ceci).
mulher(joana).
homem(joao).
homem(pedro).
homem(leandro).
filho(pedro,joao).
filho(pedro,ana).
filho(leandro,pedro).

neto(X,Y):-homem(X),filho(X,Z),filho(Z,Y).
neto(X,Y):-mulher(X),filho(X,Z),filho(Z,Y).

pais(brasil,9,130).
pais(china,12,1800).
pais(eua,9,230).
pais(india,3,450).

densidade(P,D):-pais(P,X,Y),D is Y/X.


aolado(X, Y, List) :- nextto(X, Y, List) ; nextto(Y, X, List).

%seq A ate B
seq(A,A,[A]).
seq(A,B,[A|R]):-A =< B,Num is A+1,seq(Num,B,R).

pred([],L,L).
pred([H|T],L,[H|R]):-pred(T,L,R).

pertence(X,[X|_]).
pertence(X,[_|S]) :- pertence(X,S).

ultimo(E,[E]).
ultimo(E, [H|R]) :- ultimo(E, R).
*/




