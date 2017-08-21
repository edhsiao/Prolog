%the art of prolog
%amzi.com
%http://www.amzi.com/ExpertSystemsInProlog/03backwarduncertainty.php

%estrutura de dado. estrutura(atomo,VARIAVEL)

% gosta(X,cinema) = gosta(pedro,Y),Z = [X,Y].
% X = pedro,
% Y = cinema,
% Z = [pedro, cinema].

% meta programação%%%%%%%%%%%%%%
% gosta(pedro,cinema) =.. Lista. 
% Lista = [gosta, pedro, cinema].

%transformar chamada de funcao em outra chamada de funcao
% f(a,b,c) =.. L,L2 =.. [x|L]. 
% L = [f, a, b, c],
% L2 = x(f, a, b, c).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% desestruturação
% f(Z) = f(g(a)).
% Z = g(a).



cliente(nome(manuel),sobrenome(silva),idade(50),estado_civil(casado), salario(5000),nascimento(10,abril,1966)).

cliente(nome(maria),sobrenome(pereira),idade(25),estado_civil(solteira), salario(25000),nascimento(15,fevereiro,1996)).

cliente(nome(mariana),sobrenome(pereira),idade(25),estado_civil(solteira),nascimento(15,fevereiro,1996)).

rico(salario(Sal)):- Sal > 20000. 

% cliente(N,S,Id,EC,Sal,Nasc),rico(Sal).
% cliente(N,_,_,_,Sal,nascimento(_,_,Ano)),rico(Sal), Ano > 1980.N = nome(maria),
% Sal = salario(25000),
% Ano = 1996.

% cliente(nome(N),_,_,_,salario(Sal),nascimento(_,_,Ano)),Sal > 20000, Ano > 1980, Lista=[N,Sal].

% cliente(nome(N),_,_,_,salario(Sal),nascimento(_,_,Ano)),Sal > 20000, Ano > 1980, Lista=[N,Sal].
% Lista = [dados(manuel, 50), dados(maria, 25)].

% findall(dados(N,Ano),(cliente(nome(N),_,_,_,_,nascimento(_,_,Ano)),Ano > 1980),Lista).
% Lista = [dados(maria, 1996)].

cons(Lista):- findall(dados(N,Ano),(cliente(nome(N),_,_,_,_,nascimento(_,_,Ano)),Ano > 1980),Lista).





% cliente(N,S,Id,EC,Sal,Nasc).
% N = nome(manuel),
% S = sobrenome(silva),
% Id = idade(50),
% EC = estado_civil(casado),
% Sal = salario(5000),
% Nasc = nascimento(10, abril, 1966).




gosta(pedro,cinema).
gosta(pedro,teatro).
gosta(pedro,ler).
gosta(maria,nadar).
gosta(maria,cantar).
gosta(maria,ler).


