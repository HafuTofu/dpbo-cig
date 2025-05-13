
% daftar orang dan jenis kelamin
person(peter, male).
person(jessica, female).
person(ron, male).
person(david, male).
person(sheila, female).
person(robert, male).
person(eva, female).
person(donald, male).
person(cynthia, female).
person(steven, male).
person(sandra, female).
person(francisco, male).
person(amanda, female).
person(mark, male).
person(lula, female).
person(perdo, male).
person(cleveland, male).
person(zula, female).

% daftar pernikahan
married(peter, jessica).
married(david, sheila).
married(robert, eva).
married(donald, cynthia).
married(steven, sandra).
married(francisco, amanda).

% fakta anak child(Father, Mother,Child)
child(peter, jessica, ron).
child(peter, jessica, sheila).
child(peter, jessica, robert).
child(david, sheila, steven).
child(david, sheila, cynthia).
child(robert, eva, francisco).
child(donald, cynthia, mark).
child(donald, cynthia, lula).
child(steven, sandra, perdo).
child(francisco, amanda, cleveland).
child(francisco, amanda, zula).

% rule ayah
father(Father, Child) :-
    child(Father, _, Child),
    person(Father, male).

% rule ibu
mother(Mother, Child) :-
    child(_, Mother, Child),
    person(Mother, female).

% rule anak laki-laki
son(Son, Parent) :-
    ( father(Parent, Son)
    ; mother(Parent, Son)
    ),
    person(Son, male).

% rule anak perempuan
daughter(Daughter, Parent) :-
    ( father(Parent, Daughter)
    ; mother(Parent, Daughter)
    ),
    person(Daughter, female).

% rule saudara kandung
sibling(X, Y) :-
    father(F, X), father(F, Y),
    mother(M, X), mother(M, Y),
    X \= Y.

% rule:l kakek
grandfather(GF, GC) :-
    father(GF, P),
    ( father(P, GC)
    ; mother(P, GC)
    ),
    person(GF, male).

% rule cucu perempuan dari kakek atau nenek
granddaughter(GD, GP) :-
    person(GD, female),
    ( father(GP, P)
    ; mother(GP, P)
    ),
    ( father(P, GD)
    ; mother(P, GD)
    ).

% rule bibi (saudari dari orang tua)
aunt(Aunt, Child) :-
    person(Aunt, female),
    ( father(P, Child)
    ; mother(P, Child)
    ),
    sibling(Aunt, P).

% rule keponakan laki-laki
nephew(Nephew, UncleAunt) :-
    person(Nephew, male),
    ( father(P, Nephew)
    ; mother(P, Nephew)
    ),
    sibling(P, UncleAunt).

% rule sepupu
cousin(C1, C2) :-
    ( father(P1, C1)
    ; mother(P1, C1)
    ),
    ( father(P2, C2)
    ; mother(P2, C2)
    ),
    sibling(P1, P2),
    C1 \= C2.