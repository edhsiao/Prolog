%Questao 2
pessoa(1,'Jose','Silva',20).
pessoa(2,'Maria','Oliveira',50).
pessoa(3,'Joao','Pereira',40).
pessoa(4,'Paulo','Campos',26).

cargo(1,'Diretor','A1').
cargo(2,'Professor','A2').
cargo(3,'Funcionario','A3').
cargo(3,'Funcionario','A4').

contracheque(1,2,100000).
contracheque(2,3,3000).
contracheque(3,1,100000).
contracheque(3,4,2000).

soma([],0).
soma([H|T],X):-soma(T,X1),X is X1 +H.

tam([],0).
tam([H|T],X):-tam(T,X1),X is X1 +1.

media(L,Res):- soma(L,X),tam(L,Y), Res is X/Y. 

listarMedia(Nome, Media) :-
	findall(Salario, (cargo(IdCargo,NomeCargo,_),contracheque(IdCargo,_,Salario)), Lista), media(Lista, Media).

%findall(Salario, (cargo(IdCargo,NomeCargo,_),contracheque(IdCargo,_,Salario)), Lista), media(Lista, Media).
