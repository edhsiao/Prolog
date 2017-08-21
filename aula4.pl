conecta(a,b).
conecta(b,c).
conecta(a,d).
conecta(d,c).
conecta(d,e).

lista(L):- findall((X,Y),conecta(X,Y),L).
caminho(X,Y,L):- conecta(X,Y),L=[X,Y].
caminho(X,Y,[X|L])  :-conecta(X,C),caminho(C,Y,L).


%; = ou
%, = e
%%%%% set_prolog_flag(double_quotes,chars).
%     ['aula4.pl'].

bin-->("0","1");("0";"1"),bin.
reg-->("a";"b";"c";"d"),"x".

%phrase(bin,"0001345",X).
%X = ['3','4']; false
%phrase(reg,"axbxc",L).

%S->aSb|ab

s-->"ab";("a",s,"b").

%S->b⁺a{a}⁺b
brep-->"b";("b",brep).
arep-->"a";("a",arep).
qwe-->brep,a,arep,b.



