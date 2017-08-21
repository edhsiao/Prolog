% prolog xpce
% , and ; ou
% not \= ==
% ! corte 
%         o
%        /\
%       !  o
%      /\
cor(camiseta,azul).
cor(camiseta,verde).
cor(camisa,branca).
cor(camisa,azul).
cor(bermuda,vermelho).
cor(sapato,preto).

tipo_de(camisa,uniforme).

not2(P):-
	P,!,fail.%; %arvore derivacao, achou P, para, falha.
	%true.
not2(P).

%not2(P):-
%	P,!,fail; %arvore derivacao, achou P, para, falha.
%	true.


% not(cor(X,azul)),tipo_de(X,uniforme). 0 curto ,1
% tipo_de(X,uniforme),not(cor(X,verde)). 1 , 0

%trace.
%sai do trace nodebug.
 
% pred(Entrada,Saida).
% recursao em cauda

tam([],0).
tam([_|T],X):-tam(T,Z), X is 1 + Z.  

soma([],0).
soma([H|T],X):-soma(T,Z), X is H + Z.
%soma([Cab|Cauda],Soma):-soma(Cauda,SomaCauda), Soma is Cab + SomaCauda.

max(A,B,A):-A > B,!.
max(A,B,B).

min(A,B,A):-A < B,!.
min(A,B,B).

%maior([],[]).
maior([H|[]],H).
maior([H|T],X):- maior(T,Z),max(H,Z,X).

maxmin([H|[]],H,H).
maxmin([H|T],X,Y):- maxmin(T,Z,W),max(H,Z,X),min(H,W,Y). 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maior2([X],X).
maior2([X,Y|L], M):- X >= Y,!,
		     maior2([X|L],M).	

maior2([X,Y|L], M):- maior2([Y|L],M). 		

maxmin2([X],X,X).
maxmin2([X,Y|L],A,B):- X >= Y,!, 
		       A is X, B is Y, maxmin2([X|L],A,B).	

maxmin2([X,Y|L],A,B):-  A is Y, B is X, maxmin2([Y|L],A,B).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nelem(N,L,X):-nelem(N,1,L,X).
%nelem(N,N,[X|_],X):-!.
%nelem(N,I,[_|R],X):-I1 is I+1,nelem(N,I1,R,X).	


ultimo([A],A):-!.
ultimo([_|T],X):-ultimo(T,X).

pertence(H,[H|_]):-!.
pertence(H,[_|T]):-pertence(H,T).


penultimo([X,Y],X):-!.
penultimo([_|T],X):-penultimo(T,X).


soma([],0).
soma([H|T],X):- soma(T,S), X is H + S.

somaPar([],0):-!.
somaPar([H|T],X):- H mod 2 =:= 0 ,somaPar(T,S), X is H + 

comprimento1([],0).
comprimento1([_|T],X):- comprimento1(T,S), X is S + 1. 

comprimento(L,N):-comprimento2(L,0,N).

comprimento2([],N,N).
comprimento2([_|L], Cont, _):- Cont1 is Cont +1,
				comprimento2(L,Cont1,_).
%otimiza iteracao
enesimoX(1,[X|_],X).
enesimoX(N,[_|T],X):- N1 is N - 1, enesimoX(N1,T,X).

%empilhamento //recursao busca em arvore //eficiencia e espaco
enesimoY(1,[H|_],H).
enesimoY(N,[_|T],X):- enesimoY(N1,T,X), N is N1 +1.


enesimo(N,L,X):- enesimo2(N,1,L,X).
enesimo2(N,N,[X|T],X).
enesimo2(N,Cont,[_|T],X):- Cont1 is Cont +1,
			    enesimo2(N,Cont1,T,X).
%concatena(L1,L2,L3).


concatena([],L,L).
concatena([H|L1],L2,[H|L3]):-concatena(L1,L2,L3).
%concatena(L1,L2,[1,2,3,4]).
%concatena([1,2],L2,[1,2,3,4]).

%sublista(Sub,Lista)
sublista(Sub,Lista):-concatena(L1,L2,Lista),
		     concatena(Sub,L3,L2).
%sublista([2,3],[1,2,3,4]).
%sublista(S,[1,2,3,4]).












