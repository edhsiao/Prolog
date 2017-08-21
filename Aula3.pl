/*
Verifica se um dado elemento está na lista: 
- Verifica se é a cabeça: 

	membro(X, [X | _ ]). 

- Senão descarta a cabeça e verifica o corpo: 

	membro(X,[ _ | L]):- membro(X, L).
 
- Predicado membro: 

	membro(X, [X | _ ]). 
	membro(X,[ _ | L]):- membro(X, L). 
*/

% Definir um predicado que faça a inserção de um elemento na primeira posição de uma lista. 

insere(Elem,Lista,[Elem|Lista]).

insere_posn(Elem,1,Lista,[Elem|Lista]).
insere_posn(Elem,Pos,[Cabeca|Lista],[Cabeca|Lista1]):-Pos1 is Pos-1,insere_posn(Elem,Pos1,Lista,Lista1).


%Definir um predicado que converta todos os valores de uma lista em seus valores absolutos


converte([ ], [ ]).
converte([X|L1], [Y|L2]):-abs(X,Y),converte(L1, L2).

%Escreva um predicado para encontrar o maior valor da lista. 

maior2([Maior],Maior).
/*
maior([X,Y|Cauda],Maior):-(X > Y -> Maior = X; Maior = Y),maior([X|Lista],Maior).
maior([X,Y|Cauda],Maior):-maior([Y|Cauda],Maior).*/

maior2([C|L],Maior):- maior2(L,M),(M>=C -> Maior = M; Maior = C).

%Definir o predicado ultimo(Elem, Lista) que encontra o último elemento Elem de uma lista Lista. 
%O último elemento de uma lista que tem somente um elemento é o próprio elemento. 
%O último elemento de uma lista que tem mais de um elemento é o último elemento da cauda. 

ultimo([E],E).
ultimo([_|S],E):-ultimo(S,E).



%retira(a,[a,a,a,b,a,c,d,c,c],L).
%L=[b,c,d]


