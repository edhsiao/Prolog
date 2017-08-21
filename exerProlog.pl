
%1) Um programa que recebe uma lista numerica e retorna a soma dos seus numeros pares e uma lista cotendo esses numeros
somaPar([],0,[]):-!.
somaPar([H|T],X,[H|L]):- H mod 2 =:= 0 ,
		somaPar(T,S1,L), X is S1 + H.
somaPar([H|T],X,L):- H mod 2 =:= 1 ,
		somaPar(T,X,L).

%v2
soma([],0,[]).
soma([E|C],Soma,[E|X]):-
	0=:= E mod 2,
	soma(C,Soma1,X),
	Soma is Soma1 + E.
soma([E|C],Soma,X):-
	1 =:= E mod 2,
	soma(C,Soma,X).		
		
%2) Um programa que recebe uma lista numerica e retorna essa lista sem primeiro nem o ultimo elemento

primeiro([H | _], P).
ultimo([U], U).
ultimo([_|R], U) :- ultimo(R, U).

removeULtimo
removeUltimo([_|[]],[]).
removeUltimo(
removeUltimo([H|T],[H|L]):- removeUltimo(T,L).

%v2
remove_ultimo([_],[]).
remove_ultimo([E|C],[E|L]):-
	remove_ultimo(C,L).
remove_primeiro([],[]).
remove_primeiro([_],[]).
remove_primeiro([_|C],L):-
	remove_ultimo(C,L).

%3)Um programa que recebe uma lista numerica e retorna uma nova lista que é
% a soma da primeira com seu inverso elevado ao quadrado. Logo, a operacao é 
% realizada para cada elemento da lista, nao devendo retornar um valor unico(escalar no final) .





%inverte(Lista, LInvertida):-
	inverteAux(Lista, [], LInvertida).
inverteAux([], L, L):- !. 
inverteAux([E|C], Acumulador, L):-
	inverteAux(C, [E|Acumulador], L).
elevaaoquadrado([],[]).
elevaaoquadrado([E|C],[X|L]):-
X is E*E,	
elevaaoquadrado(C,L).
soma_lista([],[],[]).
soma_lista([E|C],[E1|C1],[A|L]):-
A is E+E1,
soma_lista(C,C1,L).
soma_lista_invertida([],[]).
soma_lista_invertida(L,Lfinal):-
 	inverte(L,L1),
	elevaaoquadrado(L1,L2),
	soma_lista(L,L2,Lfinal).









