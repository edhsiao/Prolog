casou(joao, maria, dia(5, maio, 2000)). 
casou(jose,claudia, dia(11,novembro,1950)). 
casou(andre, fernanda, dia(11, agosto, 1960)). 
casou(adriano, claudia, dia(15, outubro, 1973)). 

/*
1 - Qual a data do casamento de Maria? 
2 - Qual o mês do casamento de Andre? 
3 - Quem casou antes de Adriano, considerando somente o ano de 
4 - casamento? 
5 - Quem casou a menos de 30 anos (considerando apenas o ano)? 
6 - Quem casou entre 1960 e 1990, inclusive? 


1 - casou(_,maria,D).

2 - casou(andre,_,dia(_,M,_)).

3 - casou(X,Y,dia(_,_,A)), A < 1973.   ou casou(X,_,dia(_,_,A1)), casou(adriano,_,dia(_,_,A2)), A1 < A2.

4 - casou(X,Y,dia(_,_,A)), A < 2014-30.

5 - casou(X,Y,dia(_,_,A)), A > 1960, A < 1990. 

*/

%ØFaça um predicado para verificar se X é descendente de Y (utilize a base de dados da aula passada). 
/*
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
*/



%Faça um predicado para calcular o fatorial de N recursivamente. 

fatorial(1,1).
fatorial(X,Y):- W is X-1,fatorial(W,Z),Y is Z*X.

%Faça um predicado para calcular o máximo divisor comum entre dois números recursivamente. 

mdc(X,X,X).
mdc(X, Y, R) :- X < Y, Z is Y-X, mdc(X, Z, R). 
mdc(X, Y, R) :- X > Y, mdc(Y, X, R).


%----------------------------------------------------------
canario(piupiu).
peixe(nemo).
tubarao(tutu).
vaca(mimosa).
morcego(vamp).
avestruz(xica).
salmao(alfred).

ehpeixe(X):- peixe(X);tubarao(X);salmao(X).
ehpassaro(X):- canario(X);avestruz(X).
ehmamifero(X):- vaca(X);morcego(X). 

animal(X):- ehpeixe(X);ehpassaro(X);ehmamifero(X).
delicia(X):- salmao(X).
cor(X,Y):- canario(X),Y = amarelo.
grande(X):- avestruz(X).
leite(X):-vaca(X).
alimento(X):-vaca(X);salmao(X).
anda(X):- avestruz(X);(ehmamifero(X),not(morcego(X))).
pele(X):- animal(X).
nadadeira(X):-ehpeixe(X).
nada(X):-ehpeixe(X).
asa(X):- ehpassaro(X);morcego(X).
voa(X):- (ehpassaro(X),not(avestruz(X)));morcego(X).
ovos(X):-ehpassaro(X);(ehpeixe(X),not(tubarao(X))).

/*
1. O piupiu voa?			 				voa(piupiu).
2. Qual a cor do piupiu? 		 				cor(piupiu,X).
3. A Xica voa? 				 				voa(xica).
4. A Xica tem asas? 							asa(xica).
5. O Vamp voa? Tem asas? Poem ovos? 					voa(vamp). asa(vamp). ovos(vamp).
6. Quais os nomes dos animais que põem ovos?	 			ovos(X).
7. Quais os nomes dos animais que são comestíveis? 			alimento(X).
8. Quais os nomes dos animais que se movem andando? 			anda(X).
9. Quais os nomes dos animais que se movem nadando mas não põem ovos?   nada(X),not(ovos(X)).
*/


