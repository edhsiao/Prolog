tam_lista([],0).
tam_lista([_|T],X):-tam_lista(T,X1), X is X1 + 1.

soma_lista([],0).
soma_lista([H|T],Soma):- soma_lista(T,Soma1),Soma is Soma1 + H.

% 1a. versao: remove apenas o primeiro
remover([], _, []).
remover([A|L], A, L) :- !.
remover([A|L], B, [A|L1]) :- A \= B, remover(L, B, L1).
% 2a. versao: remove todos
remover([], _, []).
remover([A|L], A, L1) :- remover(L, A, L1).
remover([A|L], B, [A|L1]) :- A \= B, remover(L, B, L1).
%============================================================
% QUESTAO 2
% calcsoma
calcsoma(1,1).
calcsoma(N, S) :- N1 is N - 1, calcsoma(N1,S1), S is S1 + 1 / N.

somaLista([],[],[]).
somaLista([H1|T1],[H2|T2],[X|L3]):-somaLista(T1,T2,L3), X is H1+H2.