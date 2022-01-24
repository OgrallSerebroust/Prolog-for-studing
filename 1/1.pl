man("Стефан").
man("Миша").
man("Жоржик").
man("Арташес").
man("Михаил").
man("Владимир").
man("Антон").
man("Павел").
woman("Юлия").
woman("Ольга").
woman("Боженна").
woman("Ирина").
isparent("Ольга", "Арташес").
isparent("Михаил", "Арташес").
isparent("Арташес", "Миша").
isparent("Арташес", "Жоржик").
isparent("Боженна", "Юлия").
isparent("Владимир", "Юлия").
isparent("Юлия", "Миша").
isparent("Юлия", "Жоржик").
isparent("Юлия", "Стефан").
isparent("Боженна", "Ирина").
isparent("Владимир", "Ирина").
isparent("Ирина", "Антон").
isparent("Ирина", "Павел").
isparent("Михаил", "Антон").
isparent("Михаил", "Павел").

/* 1 Задание
man("Стефан").
woman("Юлия").
man(X).
woman(X). */

/* 2 Задание
isparent(WHO, "Арташес").
isparent("Юлия", WHO). */
children(X) :- isparent(X, Y), write(Y).

/* 3 Задание */
mother(X, Y) :- woman(X), isparent(X, Y), !.
mother(X) :- isparent(Y, X), woman(Y), write(Y).

/* 4 Задание */
father(X, Y) :- man(X), isparent(X, Y).
father(X) :- isparent(Y, X), man(Y), write(Y), !.

/* 5 Задание */
brother(X, Y) :- isparent(A, X), man(X), isparent(A, Y), !.
brothers(X) :- isparent(Y, X), isparent(Y, A), man(A), not(A = X), write(A).

/* 6 Задание */
wife(X, Y) :- woman(X), isparent(X, A), isparent(Y, A), !.
wife(X) :- isparent(X, A), isparent(Y, A), woman(Y), write(Y), !.

/* 7 Задание */
b_s(X, Y) :- isparent(A, X), isparent(A, Y), dif(X, Y).
b_s(X) :- isparent(A, X), isparent(A, B), dif(X, B), write(B).

/* 8 Задание */
grand_pa(X, Y) :- father(X, A), isparent(A, Y).

ancle("Стефан") :- isparent(X, "Стефан"), b_s(X), isparent(X, A), isparent(Y, A), write(A).

grand_ma(X, Y) :- mother(X, A), isparent(A, Y).
grand_ma(X) :- isparent(A, X), mother(B, A), write(B). 