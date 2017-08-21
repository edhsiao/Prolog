tam([],0).
tam([_|T],X):- tam(T,L),X is L + 1.

soma([],0).
soma([H|T],Soma):- soma(T,Sum),Soma is Sum + H.

%insereElem(Elem,Pos,Lista,Result)
insereElem(Elem,1,L,[Elem|L]).
insereElem(Elem,Pos,[H|L],[H|L1]):- Pos1 is Pos - 1,insereElem(Elem,Pos1,L,L1).

max(A,B,A):- A > B,!.
max(A,B,B).

maior([H],H).
maior([H|T],X):- maior(T,Z),max(H,Z,X).

ultimo([H],H):-!.
ultimo([H|T],X):-ultimo(T,X).

penultimo([X,_],X):-!.
penultimo([_,Y|Ys],X):-penultimo([Y|Ys],X).


posElemN(N,[N|_],1).
posElemN(N,[_|T],X):- nelem(N,T,X1),X is X1 +1.

nElem(1,[X|_],X).
nElem(N,[H|T],X):- N1 is N - 1,nElem(N1,T,X).

pertence(H,[H|_]):-!.
pertence(H,[_|T]):-pertence(H,T).

rev(L,Rev):-revAux(L,Rev,[]).
revAux([],Rev,Rev):-!.
revAux([H|T],L2,L):-revAux(T,L2,[H|L]).

somaPar([],0):-!.
somaPar([H|T],X):- H mod 2 =:= 0, somaPar(T,Soma),X is Soma + H.
somaPar([H|T],X):- H mod 2 =:= 1 ,somaPar(T,X).

comprimento(L,N):-comprimento2(L,0,N).

comprimento2([],N,N).
comprimento2([_|L], Cont, _):- Cont1 is Cont +1,
				comprimento2(L,Cont1,_).
				
enesimo(N,L,X):- enesimo2(N,1,L,X),!.
enesimo2(N,N,[X|T],X).
enesimo2(N,Cont,[_|T],X):- Cont1 is Cont +1,
			    enesimo2(N,Cont1,T,X).		

concat([],L,L).
concat([H|L1],L2,[H|L3]):- concat(L1,L2,L3).		

concatenar([X|Y],Z,[X|W]):-append(Y,Z,W).

sublista(Sub,Lista):-concat(L1,L2,Lista),
		     concat(Sub,L3,L2).		
	
retira_1([H],[]).
retira_1([H|T],T).
	
retira_todas(_,[],[]).
retira_todas(E,[E|T],L):-retira_todas(E,T,L).
retira_todas(E,[E1|T],[E1|L]):-E \== E1,retira_todas(E,T,L).

retira_1_ocorrencia(E,[E|L],L).
retira_1_ocorrencia(E,[E1|L1],[E1|L]):- %E \== E1, <----insere **repeticao
				retira_1_ocorrencia(E,L1,L).
				
retira_rep([],[]).
retira_rep([E|C],[E|L]):-
	retira_todas(E,C,L1),retira_rep(L1,L).
	
insere(X,L,LF):-retira_1_ocorrencia(X,LF,L).

compress([],[]).
compress([X],[X]).
compress([X,X|Xs],Zs) :- compress([X|Xs],Zs).
compress([X,Y|Ys],[X|Zs]) :- X \= Y, compress([Y|Ys],Zs).
%compress([1,2,2,2,3,4,4,4,4,4,43,2,1],L).
%L = [1, 2, 3, 4, 43, 2, 1] 

duplicar([],[]).
duplicar([H|T],[H,H|L]):-duplicar(T,L).

%duplicarN(L,N,R).
dupli(L1,N,L2) :- dupli(L1,N,L2,N).
dupli([],_,[],_).
dupli([_|Xs],N,Ys,0) :- dupli(Xs,N,Ys,N).
dupli([X|Xs],N,[X|Ys],K) :- K > 0, K1 is K - 1, dupli([X|Xs],N,Ys,K1).
	

split(L,0,[],L).
split([X|Xs],N,[X|Ys],Zs) :- N > 0, N1 is N - 1, split(Xs,N1,Ys,Zs).

remove_enesimo(X,[X|Xs],1,Xs).
remove_enesimo(X,[Y|Xs],K,[Y|Ys]) :- K > 1, 
   K1 is K - 1, remove_enesimo(X,Xs,K1,Ys).
   
remove_enesimo2(1,[Elem|Xs],Xs).
remove_enesimo2(K,[Y|T],[Y|Ys]):- K > 1,
					K1 is K - 1, remove_enesimo2(K1,T,Ys).
					
insert_at(X,L,K,R) :- remove_at(X,R,K,L).

range(I,I,[I]):-!.
range(I,K,[I|L]):- I < K , I1 is I + 1,range(I1,K,L).

prim_ult([H,T],H,T).
prim_ult([H|T],H,L):- prim_ult([T,H,L]).

membro(X,[X|_]).
membro(X,[_|T]):-membro(X,T).

%findall(Object,Goal,List).
%findall([A,B],X,L).
%findall(Pos,coleciona(Pos,[a,b,c,a,d],[a,b,c]),Resp).

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
%===========================================================
% + = entrada
% - = saida


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% soma(+lista , - soma)
soma([],0).
soma([H|T],Soma):- soma(T,L), Soma is H + L.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% prod (+lista, - produtorio)
prod([],1).
prod([H|T],Prod):- prod(T,L), Prod is H * L.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% soma2L (+Lista1, +Lista2, - ListaSoma)
% executar apenas se os comprimentos
% forem iguais. Caso contrario,falhar.

somaLista([],[],[]).
somaLista([H1|T1],[H2|T2],[X|L3]):-somaLista(T1,T2,L3), X is H1+H2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ultimo(+Lista, - Elem)
ultimo([],[]):-!.
ultimo([H],H):-!.
ultimo([_|T],U):- ultimo(T,U).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%penultimo(+Lista, -Elem)
penultimo([],[]):-!.
penultimo([H],[]):-!.
penultimo([H,T],H):-!.
penultimo([_|T],X):-penultimo(T,X).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nesimo(+Lista,+N,-Elem)

enesimo([_|_],0,[]):-!.
enesimo([H|_],1,H):-!.
enesimo([_|T],N,X):- N1 is N - 1, enesimo(T,N1,X).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% inverte(+Lista, -Invertida)
concatenar([], L, L).
concatenar([H|T], L, [H|D]) :- concatenar(T, L, D).

inverte([], []).
inverte([H|T], L) :- inverte(T, X), concatenar(X, [H], L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pertence(+Elem, +Lista)
% resultado true ou false
pertence(H,[H|_]):-!.
pertence(H,[_|T]):-pertence(H,T).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diag(+Matriz, -Lista)
% Ex:
% |1 2 3|     
% |4 5 6| ---> |1 5 9|
% |7 8 9|  

removeCol([],[]).
removeCol([[_|T]|OutrasLinhas],[T|X]) :-removeCol(OutrasLinhas,X).

diagonal([],[]).
diagonal([[H|_]|OutrasLinhas],[H|T]) :-
	removeCol(OutrasLinhas,X),diagonal(X,T).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% substitui(+Lista,+Elem,+NovoElem, -NovaLista)

substitui([],X,Y,[]):-!.
substitui([X|L],X,Y,[Y|L1]):-substitui(L,X,Y,L1).
substitui([Z|L],X,Y,[Z|L1]):- X \== Z, substitui(L,X,Y,L1).

sub([[]|_], []) :- !.
sub([[H|T]|OutrasLinhas], [ColRem|MT]) :-
    rem_1_col([[H|T]|OutrasLinhas], ColRem, [T|NRs]),
    sub([T|NRs], MT).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% transposta(+Matriz, - Transp)
% ex : transposta([[1,2],[3,4]],T)
% T = [[1,3]],[2,4]].

%|1 2| __ |1 3|
%|3 4|    |2 4|

% |1 2 3|      |1 4 7|
% |4 5 6| ---> |2 5 8|
% |7 8 9|      |3 6 9|	

sep_1_col([], [], []).
sep_1_col([[]|_], [], []).
sep_1_col([[H|T]|OutrasLinhas], [H|ColRem], [T|Resto]) :-
   sep_1_col(OutrasLinhas, ColRem, Resto).

transposta([[]|_], []) :- !.
transposta([[H|T]|OutrasLinhas], [ColRem|MT]) :-
    sep_1_col([[H|T]|OutrasLinhas], ColRem, [T|NRs]),
    transposta([T|NRs], MT).


%%%%%%%%%%%% Versao 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%55
n_esimo(1,[E|_],E):-!.
n_esimo([_|Cauda],E):-
	N1 is N -1,
	n_esimo(N1,Cauda,E).

pega_enesimos(_,[],[]):-!.
pega_enesimos(N,[Linha|Cauda],[E|NovaLinha]):-
		n_esimo(N,Linha,E),
		pega_enesimos(N,Cauda,NovaLinha).

comprimento([],0).
comprimento([_|Cauda],Comp):-
		comprimento(Cauda,C1),
		Comp is C1 +1.

%Matriz = [[1,2],[3,4],[a,b]],comprimento(Matriz,Comp).

transposta2([Linha|Cauda],Transp):-
	comprimento(Linha,NCol),
	transp([Linha|Cauda],1,NCol,Transp).

transp(_,N,NCol, []):- N > Ncol,!.			
transp(Matriz,N,NCol,[NovaLinha|Transp]):-
	pega_enesimos(N,Matriz,NovaLinha),
	N1 is N +1,
	transp(Matriz,N1,Ncol,Transp).

% pessoa(Id, Nome,Sobrenome,Sexo,Idade)
% cargos(Id,Nome,Salario)
% funcionario (IDPessoa,IDCargo)


pessoa(1,'Maria','Silva','F','30').
pessoa(2,'Claudia','Cruz','F','45').
pessoa(3,'Joao','Santos','M','20').
pessoa(4,'Antonio','Manuel','M','50').

cargos(1,'Diretor',50000,10).	%10
cargos(2,'Vendedor',2000,2).	%2
cargos(3,'Gerente',8000,5).		%5

funcionario(2,1).
funcionario(1,2).
funcionario(3,2).
funcionario(4,3).
%bonus(pessoa,B)

bonus(Pessoa,B):-pessoa(Ip,Pessoa,_,_,_),funcionario(Ip,Ic),cargos(Ic,_,_,B).

bonus2(IDPessoa,B):-pessoa(IDPessoa,_,_,_,_),funcionario(IDPessoa,Ic),cargos(Ic,_,_,B).

% findall(resultado(Pessoa,B),(pessoa(Ip,Pessoa,_,_,_),funcionario(Ip,Ic),cargos(Ic,_,_,B)),Lista).

% findall(resultado(IDPessoa,B),(pessoa(IDPessoa,_,_,_,_),funcionario(IDPessoa,Ic),cargos(Ic,_,_,B)),Lista).

bonus(Pessoa,B):-
			funcionario(IDPessoa,IDCargo),cargos(IDCargo,_,Salario,_),
			(IDCargo =:= 1, B is Salario * 10/100,
			 IDCargo =:= 2, B is Salario * 2/100,
			 IDCargo =:= 3, B is Salario * 5/100).

% findall([IDPessoa,Bonus],bonus(IDPessoa,Bonus),ListaBonus).
% findall([Nome,Sobrenome,Bonus],bonus(IDPessoa,Bonus),ListaBonus).

bonus2(Pessoa,B):-
			funcionario(IDPessoa,IDCargo),cargos(IDCargo,_,Salario,Bonus),
			B is Salario * Bonus /100.

%findall(Object,Goal,List).
%findall([A,B],X,L).

%findall(Pos,coleciona(Pos,[a,b,c,a,d],[a,b,c]),Resp).
%?- findall(Pos,coleciona(Pos,[a,b,c,a,d],[a,b,c]),Resp).
%Resp = [[1, 2, 3], [4, 2, 3]].


%<reg> → (a|b|c|d) x
reg --> ("a";"b";"c";"d"), "x".

%<bin> → (0|1) | (0|1)<bin>
bin --> ("0";"1") ; ("0";"1"), bin.

%phrase(regra, sentença, resto)
%phrase(regra, sentença)

%opcional [] ou ""

%S->aSb|ab

s-->"ab";("a",s,"b").

%S->b⁺a{a}⁺ b
brep-->("";"b",brep).
arep-->("";"a",arep).
ss-->("b",brep,"aa",arep,"b").


dig-->("0";"1";"2";"3";"4";"5";"6";"7";"8";"9").
num-->(dig;dig,num).
expr-->(num;num,"+",expr;num,"-",expr).


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

%removeULtimo
removeUltimo([_|[]],[]).
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


