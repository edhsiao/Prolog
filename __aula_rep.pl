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

