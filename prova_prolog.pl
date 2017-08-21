%Questao 1
% (1,5 ponto) Escreva um predicado denominado intervalo
% (+Lista, -Intervalo) que recebe uma
% lista numérica e retorna uma lista contendo
% os valores de mínimo e máximo da primeira.

menor([], L, L):-!.
menor([H|T], E, Min):-	H < E, menor(T, H, Min).
menor([H|T], E, Min):- H >= E,menor(T, E, Min).
	
maior([], V, V):-!.
maior([H|T], E, Max):-H < E,maior(T, E, Max).
maior([H|T], E, Max):-H >= E,maior(T, H, Max).

intervalo([], []).
intervalo([H|T], [Min, Max]):-
	menor(T, H, Min),
	maior(T, H, Max).

	
%Questao 2
%(2 pontos) Dada a estrutura a seguir:
%pessoa(ID_pessoa, Nome, Sobrenome, Idade)
%cargo(ID_cargo, Nome, Departamento)
%contracheque(ID_cargo, ID_pessoa, Salário)
%construa um predicado que retorna a média salarial por cargo.

pessoa(1,'Jose','Silva',20).
pessoa(2,'Maria','Oliveira',50).
pessoa(3,'Joao','Pereira',40).
pessoa(4,'Paulo','Campos',26).

cargo(1,'Diretor','A1').
cargo(2,'Professor','A2').
cargo(3,'Funcionario','A3').
cargo(4,'Funcionario','A3').

contracheque(1,2,100000).
contracheque(2,3,7000).
contracheque(3,4,2000).
contracheque(4,1,1000).

soma([],0).
soma([H|T],X):-soma(T,X1),X is X1 +H.

tam([],0).
tam([H|T],X):-tam(T,X1),X is X1 +1.

media(L,Res):- soma(L,X),tam(L,Y), Res is X/Y.%/

%listarMedia(NomeCargo, Media) :-
%	findall(Salario,(cargo(IdCargo,_,_),contracheque(IdCargo,_,Salario)), Lista), media(Lista, Media),
%	findall(NomeCargo,(cargo(IdCargo,NomeCargo),_),contracheque(IdCargo,_,Salario),Lista).

mediaFuncionario(Media):-
	findall(Salario,(cargo(IdCargo,NomeCargo,_),contracheque(IdCargo,_,Salario),NomeCargo == 'Funcionario'), Lista), media(Lista, Media).
	
mediaDiretor(Media):-
	findall(Salario,(cargo(IdCargo,NomeCargo,_),contracheque(IdCargo,_,Salario),NomeCargo == 'Diretor'), Lista), media(Lista, Media).
	
mediaProfessor(Media):-
	findall(Salario,(cargo(IdCargo,NomeCargo,_),contracheque(IdCargo,_,Salario),NomeCargo == 'Professor'), Lista), media(Lista, Media).

%findall(Salario, (cargo(IdCargo,'Funcionario',_),contracheque(IdCargo,_,Salario)), Lista), media(Lista, Media).
%Lista = [1000, 2000],
%Media = 1500.

 %findall((NomeCargo,Salario), (cargo(IdCargo,NomeCargo,_),contracheque(IdCargo,_,Salario)), Lista).
%Lista = [ ('Diretor', 100000), ('Professor', 7000), ('Funcionario', 1000), ('Funcionario', 2000)].


cargoOrd(NomeCargo,Cond,Lista):-
	findall(NomeCargo,Cond,Resultado),sort(Resultado,Lista).
%	cargo(IdCargo,NomeCargo,_)
calculaMediaSalarioPorCargo(C, M):-
	findall([Cargo, Salario], contracheque(Cargo, _, S), Lista).	
	

%Questao 3
%(1 ponto) Escreva um predicado que verifica se uma lista e palindroma.
%Implemente todos os predicados necessarios.
%
inverte(L1,L2):- inverte_aux(L1,[],L2).
inverte_aux([],L,L):-!.
inverte_aux([H|T],Z,L):- inverte_aux(T,[H|Z],L).

palindromo(X):- inverte(X,X).
%palindrome(X):-reverse(X,X).
