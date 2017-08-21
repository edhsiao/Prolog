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
	


ultimo([A],A):-!.
ultimo([_|T],X):-ultimo(T,X).

pertence(H,[H|_]):-!.
pertence(H,[_|T]):-pertence(H,T).


penultimo([X,Y],X):-!.
penultimo([_|T],X):-penultimo(T,X).














%westworld
