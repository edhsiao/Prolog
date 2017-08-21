% dynamic marca um predicado como dinâmico (permite adicionar novos fatos
% ao predicado com assertz/1)

:- dynamic classificacao/3.
:- dynamic cliente/8.
:- dynamic idioma/2.
:- dynamic requisito/7.
:- dynamic distribuidora/2.
:- dynamic genero/4.
:- dynamic jogos/9.
:- dynamic jogo_idioma/2.
:- dynamic desenvolvedor/4.
:- dynamic jogo_desenvolvedor/2.
:- dynamic compra/4.
:- dynamic pagamento/5.

%inserir/remover dados com assertz/retract/retractall
%assertz(cliente(11,'bolso','opressor','jair','1955-06-12','Rua 7 de setembro','Brasilia','bolsonaro@2018.com')).
%retractall(cliente(11,'bolso','opressor','jair','1955-06-12','Rua 7 de setembro','Brasilia','bolsonaro@2018.com')).
%retract(cliente(1, 'dilmete', 'pronatec', 'dilma', '1947-12-14', 'Rua 13 de janeiro', 'Porto Alegre', 'dilminha13@red.com'))




%classificacao(Simbolo,Idade Minima,Descricao)
classificacao('L',0,'Não expõe crianças a conteúdos potencialmente prejudiciais').
classificacao('10+',10,'Conteúdo violento ou linguagem inapropriada para crianças, mesmo em menor intensidade').
classificacao('12+',12,'As cenas podem conter agressão física, consumo de drogas e insinuação sexual').
classificacao('14+',14,'Conteúdos mais violentos e/ou de linguagem sexual mais acentuada ').
classificacao('16+',16,'Conteúdos mais violentos ou com conteúdo sexual mais intenso, com cenas de tortura, suicídio, estupro ou nudez total ').
classificacao('18+',18,'Conteúdos violentos e sexuais extremos. Cenas de sexo, incesto ou atos repetidos de tortura, mutilação ou abuso sexual.').

%cliente(ID,Login,Senha,Nome,Data_nascimento,EndereÃ§o,Cidade,Email)

cliente(1,'dilmete','pronatec','dilma','1947-12-14','Rua 13 de janeiro','Porto Alegre','dilminha13@red.com').
cliente(2,'aecinho','leviana','aecio','1945-04-05','Rua 5 de abril','Belo Horizonte','aecinho45@blue.com').
cliente(3,'marisilva','acreexiste','marina','1940-12-25','Rua 25 de dezembro','Rio Branco','marina40@sustenta.com').
cliente(4,'lulu','burguesiaopressora','luciana','1950-07-30','Rua 30 de julho','Porto Alegre','lulu50@sol.com').
cliente(5,'pastore','privatizar','everaldo','1906-06-06','Rua 06 dejunho','Rio de Janeiro','pastor666@hell.com').
cliente(6,'edudu','naotenhonadacomisso','eduardo','1949-10-29','Rua 29 de outubro','Salvador','educanabis@loco.com').
cliente(7,'levix','orgaoexcretor','levy','1951-12-27','Rua 27 de dezembro','Mutum','levyano@lol.com').
cliente(8,'zemaria','ptobaralho','jose','1957-10-02','Rua 2 de outubro','Sao Paulo','zema16@pstu.com').
cliente(9,'eysus','jesusodeiasatanas','eymael','1939-11-02','Rua 2 de novembro','Porto Alegre','eymael777@ceu.com').
cliente(10,'iasi','leninrules','mauro','1960-10-21','Rua 21 de outubro','Sao Paulo','maumau666@urss.com').

%idioma(ID,Nome)

idioma(1,'Ingles').
idioma(2,'Portugues').
idioma(3,'Espanhol').
idioma(4,'Russo').
idioma(5,'Alemao').

%requisito(Id,CPU,Memoria,HD,Conexao,SO,Placa_Video)

requisito(1,'Intel Core 2 Duo E6600 + ou AMD Phenom X3 8750 +','2 GB','8 GB','SIM','WINDOWS ou LINUX','256 MB+').
requisito(2,'Pentium 4 3.0GHz +','2 GB','13GB','SIM','WINDOWS ou LINUX ou MAC','128 MB+').
requisito(3,'3.0 GHz P4, Dual Core 2.0 + ou AMD64X2 +','2 GB','8 GB','SIM','WINDOWS','512 MB+').
requisito(4,'Intel Core2Quad Q8400  2.6 GHz ou AMD Athlon II X4 620  2.6 GHz +','2 GB','30 GB','SIM','WINDOWS','512 MB').
requisito(5,'Intel Core 2 Duo 2.0 GHz or AMD Athlon X2 64 2.4GHz','1.5 GB','8 GB','NAO','LINUX','128 MB').

%distribuidora(Id,Nome)

distribuidora(1,'Valve').
distribuidora(2,'Bethesta').
distribuidora(3,'Ubisoft').
distribuidora(4,'Kiel').
distribuidora(5,'EA').

%genero(ID,Nome,Descricao,simbolo_class)

genero(1,'Acao','Jogo de acao 12+','12+').
genero(2,'Terror','Jogo de terror 18+','18+').
genero(3,'Aventura','Jogo de aventura 10+','10+').
genero(4,'Esporte','Jogo de esporte livre','L').
genero(5,'Luta','Jogo de luta 14+','14+').

%jogos(ID,Nome,Data_lancamento,Descricao,Num_jogadores_max,Preco,Id_distribuidora,id_requisito,id_genero)

jogos(1,'Counter-Strike: Global Offensive','2012-08-21', 'Counter-Strike: Global Offensive (CS: GO) expandirá na jogabilidade de ação baseada em equipes na qual foi pioneiro quando foi lançado há 12 anos. CS: GO contém novos mapas, personagens e armas, além de conter versões atualizadas de conteúdos do CS clássico (como de_dust).',32,24.99,1,1,1).
jogos(2,'Left 4 Dead 2','2009-11-17','Left 4 Dead 2, assim como seu antecessor, é um jogo multiplayer de survival horror e cooperação de tiro em primeira pessoa. É a sequência do jogo ganhador de prêmios da Valve Corporation, Left 4 Dead. O jogo foca a jogabilidade cooperativa do original e usa a engineSource da Valve, a mesma engine usada em Left 4 Dead.',8,34.99,1,2,2).
jogos(3,'Portal 2','2011-04-18','Portal é um jogo de ação/puzzle em primeira pessoa desenvolvido pela Valve Corporation. Portal 2 origina-se da premiada fórmula de jogabilidade, história e música inovadoras que rendeu ao Portal original mais de 70 prêmios da indústria e criou uma legião cultural.',2,34.99,1,3,3).
jogos(4,'The Elder Scrolls V: Skyrim','2011-11-11','The Elder Scrolls V: Skyrim é um RPG eletrônico desenvolvido pela Bethesda Game Studios e publicado pela BethesdaSoftworks. É o quinto jogo da série The Elder Scrolls, seguindo The Elder Scrolls IV: Oblivion.',1,39.99,2,4,3).
jogos(5,'Assassin’s Creed® IV Black Flag','2013-11-19','Assassin`s Creed IV: Black Flag segue as aventuras de Edward Kenway, um notável pirata e corsário que viveu na Época Dourada da Pirataria, pai de HaythamKenway e avô de Ratonhnhaké:ton (ConnorKenway), os personagens jogáveis de Assassin`sCreed III',8,79.99,3,5,3).
jogos(6,'Don`t Starve','2013-04-23','Don`t Starve é um curioso jogo, disponível para Windows, Mac e Linux, em que o jogador precisa sobreviver em condições precárias com seu personagem. Porém, sempre com bom humor e encarando situações que podem ser estranhas e divertidas ao mesmo tempo.',1,27.99,4,3,3).
jogos(7,'Goat Simulator','2014-04-01','Goat Simulator, No jogo o jogador controla uma cabra que visa fazer o máximo dano possível em torno de um mapa de mundo aberto, sem quaisquer outros objetivos maiores. O jogo, desenvolvido inicialmente como um protótipo de uma piada e mostrado em um estado alfa no início de vídeos do YouTube, foi recebido com entusiasmo e atenção, o que levou o estúdio a construir o jogo em um estado disponível controlando vários bugs e falhas para manter o valor de entretenimento do jogo.',1,19.99,4,1,3).
jogos(8,'Injustice: GodsAmongUsUltimate Edition','2013-11-12','Injustice: GodsAmongUsUltimateEdition aprimora o novo e ousado jogo de luta da NetherRealmStudios. Com seis personagens novos, mais de 30 skins atuais e 60 missões inéditas dos Laboratórios S.T.A.R., esta edição vai causar impacto.',2,36.99,5,4,5).
jogos(9,'FIFA 16','2015-09-23','O FIFA 16 foi totalmente recriado com gráficos belíssimos, efeitos de física incríveis e controle sem igual.',4,66.60,5,3,4).
jogos(10,'Need For Speed: Hot Pursuit','2010-11-16','Hot Pursuit é uma volta da série a suas origens e, como o nome sugere, é uma releitura do estilo dos jogos Hot Pursuit originais, com carros exclusivos e perseguições em alta velocidade. Nele, o jogador poderá jogar como policial, dirigindo até, um poderoso PaganiZonda, e terá um modo de carreira para os dois lados.',2,29.99,5,1,5).

%jogo_idioma(Id_idioma,id_jogo)
jogo_idioma(1,1).
jogo_idioma(2,1).
jogo_idioma(3,1).
jogo_idioma(4,1).
jogo_idioma(5,1).
jogo_idioma(1,2).
jogo_idioma(2,2).
jogo_idioma(5,2).
jogo_idioma(2,3).
jogo_idioma(1,4).
jogo_idioma(4,4).
jogo_idioma(2,5).
jogo_idioma(3,5).
jogo_idioma(4,5).
jogo_idioma(1,6).
jogo_idioma(2,6).
jogo_idioma(3,6).
jogo_idioma(4,6).
jogo_idioma(5,6).
jogo_idioma(2,7).
jogo_idioma(3,7).
jogo_idioma(1,8).
jogo_idioma(3,8).
jogo_idioma(5,8).
jogo_idioma(3,9).
jogo_idioma(5,9).
jogo_idioma(1,10).
jogo_idioma(3,10).
jogo_idioma(4,10).
jogo_idioma(5,10).

%desenvolvedor(Id,Pais,Nome,Id_distribuidora)
desenvolvedor(1,'EUA','Valve',1).
desenvolvedor(2,'Canada','Bethesta',2).
desenvolvedor(3,'UK','Ubisoft',3).
desenvolvedor(4,'EUA','Warner',5).
desenvolvedor(5,'Alemanha','Kiel',4).

%jogo_desenvolvedor(Id_jogo,Id_desenvolvedor)

jogo_desenvolvedor(1,1).
jogo_desenvolvedor(2,1).
jogo_desenvolvedor(3,1).
jogo_desenvolvedor(4,2).
jogo_desenvolvedor(5,3).
jogo_desenvolvedor(6,4).
jogo_desenvolvedor(7,4).
jogo_desenvolvedor(8,5).
jogo_desenvolvedor(9,5).
jogo_desenvolvedor(10,5).

%compra(Id,Id_jogo,Id_cliente,data)
compra(1,1,3,'2013-12-25').
compra(2,4,1,'2014-01-01').
compra(3,2,5,'2013-12-25').
compra(4,8,4,'2075-06-06').
compra(5,3,4,'1016-12-25').
compra(6,10,9,'1956-10-16').
compra(7,7,7,'2011-11-11').
compra(8,5,2,'2017-07-07').
compra(9,2,2,'2018-08-08').
compra(10,2,8,'2019-09-09').

%pagamento(Id,Valor,Situacao,Id_cliente,Tipo)
pagamento(1,19.99,'pago',1,'CC').
pagamento(2,36.99,'pendente',3,'BO').
pagamento(3,27.99,'pago',4,'BO').
pagamento(4,19.99,'pago',9,'BO').
pagamento(5,79.99,'pago',10,'CC').
pagamento(6,66.60,'pendente',7,'BO').

pegarJogosComPreco(Lista) :-
	findall([ID, Nome, Preco], jogos(ID, Nome, _, _, _, Preco, _, _, _), Lista).

pegarDesenvolvedores(Pais, Lista) :-
	findall([ID, Nome], desenvolvedor(ID, Pais, Nome, _), Lista).

pegarIdiomas(NomeJogo, Lista) :-
	findall([Idioma], (jogos(IDJogo, NomeJogo, _, _, _, _, _, _, _), jogo_idioma(IDIdioma, IDJogo), idioma(IDIdioma, Idioma)), Lista).

% ordem de comparacao do @<: Variables < Numbers < Strings < Atoms <
% Compound Terms

listarClientesComCompras(AntesDe, Lista) :-
	findall([ID, Nome], (compra(_, _, ID, Data), Data @< AntesDe, cliente(ID, _, _, Nome, _, _, _, _)), Lista).

listarClientesQueCompraram(NomeJogo, Lista) :-
	findall([ID, Nome], (
		    compra(_, IDJogo, ID, _),
		    jogos(IDJogo, NomeJogo, _, _, _, _, _, _, _),
		    cliente(ID, _, _, Nome, _, _, _, _)), Lista).

listarMediaDePrecos(NomeDistribuidora, Media) :-
	findall(Preco, (distribuidora(ID, NomeDistribuidora), jogos(_, _, _, _, _, Preco, ID, _, _)), Lista),
	media(Lista, Media).

soma([], 0).
soma([Cabeca|Cauda], Soma) :-
	soma(Cauda, ProxSoma),
	Soma is ProxSoma + Cabeca.

media(Lista, Media) :-
	soma(Lista, Soma),
	length(Lista, Tam),
	Media is Soma / Tam.

%27 ?- findall(Pais, desenvolvedor(_, Pais, _, _), L).
%L = ['EUA', 'Canada', 'UK', 'EUA', 'Alemanha'].
%%%%%%%%findall(NomeCargo,(cargo(IdCargo,NomeCargo,_)),Lista).

%28 ?- findDedup(Pais, desenvolvedor(_, Pais, _, _), L).
%L = ['Alemanha', 'Canada', 'EUA', 'UK'].	
	
findDedup(Var, Cond, Lista):-
	findall(Var, Cond, Resultado), sort(Resultado, Lista).	
	
%cliente(ID,Login,Senha,Nome,Data_nascimento,End,Cidade,Email)	
alterarLoginCliente(ID, NovoLogin) :-
   cliente(ID,_,Senha,Nome,Data_nascimento,End,Cidade,Email),
   retractall(cliente(ID,_,_,_,_,_,_,_)),
   assertz(cliente(ID,NovoLogin,Senha,Nome,Data_nascimento,End,Cidade,Email)).  
   
alterarNomeCliente(ID, NovoNome) :-
   cliente(ID,Login,Senha,_,Data_nascimento,End,Cidade,Email),
   retractall(cliente(ID,_,_,_,_,_,_,_)),
   assertz(cliente(ID,Login,Senha,NovoNome,Data_nascimento,End,Cidade,Email)).
  
alterarSenhaCliente(ID, NovaSenha) :-
   cliente(ID,Login,_,Nome,Data_nascimento,End,Cidade,Email),
   retractall(cliente(ID,_,_,_,_,_,_,_)),
   assertz(cliente(ID,Login,NovaSenha,NovoNome,Data_nascimento,End,Cidade,Email)).  
   
alterarDataNascCliente(ID, NovaDataNasc) :-
   cliente(ID,Login,Senha,Nome,_,End,Cidade,Email),
   retractall(cliente(ID,_,_,_,_,_,_,_)),
   assertz(cliente(ID,Login,Senha,NovoNome,NovaDataNasc,End,Cidade,Email)).
   
alterarEndCliente(ID, NovoEnd) :-
   cliente(ID,Login,Senha,Nome,DataNasc,_,Cidade,Email),
   retractall(cliente(ID,_,_,_,_,_,_,_)),
   assertz(cliente(ID,Login,Senha,NovoNome,DataNasc,NovoEnd,Cidade,Email)).
   
alterarCidadeCliente(ID, NovaCidade) :-
   cliente(ID,Login,Senha,Nome,DataNasc,End,_,Email),
   retractall(cliente(ID,_,_,_,_,_,_,_)),
   assertz(cliente(ID,Login,Senha,Nome,DataNasc,End,NovaCidade,Email)).

alterarEmailCliente(ID, NovoEmail) :-
   cliente(ID,Login,Senha,Nome,DataNasc,End,Cidade,_),
   retractall(cliente(ID,_,_,_,_,_,_,_)),
   assertz(cliente(ID,Login,Senha,Nome,DataNasc,End,NovaCidade,NovoEmail)).
   