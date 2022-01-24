man("������").
man("����").
man("������").
man("�������").
man("������").
man("��������").
man("�����").
man("�����").
woman("����").
woman("�����").
woman("�������").
woman("�����").
isparent("�����", "�������").
isparent("������", "�������").
isparent("�������", "����").
isparent("�������", "������").
isparent("�������", "����").
isparent("��������", "����").
isparent("����", "����").
isparent("����", "������").
isparent("����", "������").
isparent("�������", "�����").
isparent("��������", "�����").
isparent("�����", "�����").
isparent("�����", "�����").
isparent("������", "�����").
isparent("������", "�����").

/* 1 �������
man("������").
woman("����").
man(X).
woman(X). */

/* 2 �������
isparent(WHO, "�������").
isparent("����", WHO). */
children(X) :- isparent(X, Y), write(Y).

/* 3 ������� */
mother(X, Y) :- woman(X), isparent(X, Y), !.
mother(X) :- isparent(Y, X), woman(Y), write(Y).

/* 4 ������� */
father(X, Y) :- man(X), isparent(X, Y).
father(X) :- isparent(Y, X), man(Y), write(Y), !.

/* 5 ������� */
brother(X, Y) :- isparent(A, X), man(X), isparent(A, Y), !.
brothers(X) :- isparent(Y, X), isparent(Y, A), man(A), not(A = X), write(A).

/* 6 ������� */
wife(X, Y) :- woman(X), isparent(X, A), isparent(Y, A), !.
wife(X) :- isparent(X, A), isparent(Y, A), woman(Y), write(Y), !.

/* 7 ������� */
b_s(X, Y) :- isparent(A, X), isparent(A, Y), dif(X, Y).
b_s(X) :- isparent(A, X), isparent(A, B), dif(X, B), write(B).

/* 8 ������� */
grand_pa(X, Y) :- father(X, A), isparent(A, Y).

ancle("������") :- isparent(X, "������"), b_s(X), isparent(X, A), isparent(Y, A), write(A).

grand_ma(X, Y) :- mother(X, A), isparent(A, Y).
grand_ma(X) :- isparent(A, X), mother(B, A), write(B). 