:- dynamic entry/3.
:- dynamic relation/5.
:- dynamic currentid/2.

nextid(ID, Type) :-
	\+ currentid(ID, Type),
	ID = 1,
	assertz(currentid(2, Type)).

nextid(ID, Type) :-
	currentid(ID, Type),
	NextID is ID + 1,
	retractall(currentid(_, Type)),
	assertz(currentid(NextID, Type)).

addrule(Rule) :-
	\+ Rule,
	assertz(Rule).

addentry(Type, Record, ID) :-
	nextid(ID, Type),
	assertz(entry(Type, ID, Record)).

addentry(Type, Record, Relations, ID) :-
	addentry(Type, Record, ID),
	addrelations(Type, ID, Relations).

addrelation(From, FromID, Relation, ToID) :-
	schema(From, _, Relations),
	member((Relation, To), Relations),
	entry(To, ToID, _),
	addrule(relation(From, FromID, Relation, To, ToID)).

addrelations(_, _, []).
addrelations(From, FromID, [(Relation, ToID)|Relations]) :-
	addrelation(From, FromID, Relation, ToID),
	addrelations(From, FromID, Relations).

schema(publisher, [name], []).
schema(genre, [name], []).
schema(console, [name, fullname, year], [(madeby, publisher)]).
schema(game,
       [name, players, year],
       [(ofgenre, genre), (publishedby, publisher), (forconsole, console)]).

bootstrap :-
	addentry(publisher, ["Nintendo"], P1),
	addentry(publisher, ["Konami"], P2),
	addentry(publisher, ["Sega"], P3),
	addentry(publisher, ["Square"], P4),

	addentry(genre, ["Platformer"], G1),
	addentry(genre, ["Action"], G2),
	addentry(genre, ["RPG"], G3),

	addentry(console, ["SNES", "Super Nintendo Entertainment System", 1990], [(madeby, P1)], C1),
	addentry(console, ["MD", "Sega Genesis", 1988], [(madeby, P3)], C2),

	addentry(game, ["Sunset Riders", 2, 1992], [(ofgenre, G2), (publishedby, P2), (forconsole, C2)], _),
	addentry(game, ["Sunset Riders", 2, 1993], [(ofgenre, G2), (publishedby, P2), (forconsole, C1)], _),
	addentry(game, ["Super Mario World", 2, 1990], [(ofgenre, G1), (publishedby, P1), (forconsole, C1)], _),
	addentry(game, ["Final Fantasy IV", 1, 1991], [(ofgenre, G3), (publishedby, P4), (forconsole, C1)], _),
	addentry(game, ["Sonic The Hedgehog", 1, 1991], [(ofgenre, G1), (publishedby, P3), (forconsole, C2)], _),
	addentry(game, ["Kid Chameleon", 1, 1992], [(ofgenre, G2), (publishedby, P3), (forconsole, C2)], _),
	!.

relations(From, FromID, List) :-
	findall((Is, ToID), relation(From, FromID, Is, _, ToID), List).

queryrecord(Type, Field, Value, ID, Record) :-
	schema(Type, Schema, _),
	nth1(Slot, Schema, Field),
	entry(Type, ID, Record),
	nth1(Slot, Record, Value).

queryrecord(Type, Field, Value, ID) :-
	queryrecord(Type, Field, Value, ID, _).

queryrecords(Type, Field, Value, Result) :-
	findall(ID, queryrecord(Type, Field, Value, ID), Result).

queryrecords(Type, Field, Value, Result, full) :-
	findall((ID, Record), queryrecord(Type, Field, Value, ID, Record), Result).

queryrelation(From, FromID, Relation, To, ToID) :-
	schema(From, _, RelationTypes),
	member((Relation, To), RelationTypes),
	relation(From, FromID, Relation, To, ToID).

queryrelation(From, FromID, Relation, ToID) :-
	queryrelation(From, FromID, Relation, _, ToID).

queryrelation(From, FromID, Relation, To, ToID, FromData, ToData) :-
	queryrelation(From, FromID, Relation, To, ToID),
	entry(From, FromID, FromData),
	entry(To, ToID, ToData).

queryrelation(From, FromID, Relation, ToID, FromData, ToData) :-
	queryrelation(From, FromID, Relation, _, ToID, FromData, ToData).








