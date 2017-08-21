%Questao 1
%intervalo(+Lista,-Intervalo)
maior(A,B,A):-A>B.
maior(A,B,B).

menor(A,B,A):-A<B.
menor(A,B,A).

%maximo()
intervalo([],_,_0).
intervalo([H|T],Maior,Menor):-intervalo(T,Maior,Menor),maior(H,X,Maior),menor(H,X,Menor).