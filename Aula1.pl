/*Aula 1 Prolog

Aridade = Qtd de parâmentro

swipl 
-------------------------
- Carregar script
consult('prog.pl'). 
ou
['prog.pl'].
--------------------------
consult(user).
[user]

ctrl+d => compilar user
---------------------------
*/


/*
%fato

fruta(abacate).
fruta(uva).

%regra-> cabeça + corpo

q:-fruta(X),write(X),nl.

*/

/*
gosta(joao,peixe).
gosta(joao,maria).
gosta(maria,livro).
gosta(pedro,livro).
gosta(maria,flor).
gosta(maria,vinho).
*/

%Exercicio

ladrao(joao).
ladrao(pedro).
gosta(maria,comida).
gosta(maria,vinho).
gosta(joao,rubi).

gosta(joao,X):-gosta(X,vinho).
rouba(X,Y):-ladrao(X),gosta(X,Y).
%------------------------------------
progenitor(pedro,carlos).
progenitor(pedro,ana).
progenitor(carlos,antonio).
progenitor(carlos,maria).
progenitor(joana,ana).
progenitor(joana,carlos).
homem(pedro).
homem(carlos).
homem(antonio).
mulher(joana).
mulher(maria).
mulher(ana).

pai(X,Y):- progenitor(X,Y),homem(X).
mae(X,Y):- progenitor(X,Y),mulher(X).
irmaos(X,Y):- pai(P,X),mae(M,X),pai(P,Y),mae(M,Y),X\=Y.

%------------------------------------------------------
passaro(tweety).
peise(goldie).
minhoca(squiggly).



