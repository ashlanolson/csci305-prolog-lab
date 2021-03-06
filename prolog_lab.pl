%Ashlan Olson
%CSCI 305 Prolog Lab 2

%Rule that finds if M is C's mother
mother(M,C):- parent(M,C), female(M).

%Rule that finds if F is C's father
father(F,C):- parent(F,C), male(F).

%Rule that finds if A is the spouse of B
spouse(A,B):- married(A,B);married(B,A).

%Rule that finds if C is P's child
child(C,P):- parent(P,C).

%Rule that finds if S is P's son
son(S,P):- child(S,P), male(S).

%Rule that finds if D is P's daughter
daughter(D,P):- child(D,P),female(D).

%Rule that finds if A and B are both children of P, making them siblings
sibling(A,B):- child(A,P),child(B,P),not(A=B).

%Rule that finds if B is A's brother
brother(B,A):- sibling(B,A),male(B).

%Rule that finds if S is A's sister
sister(S,A):- sibling(S,A), female(S).

%Rule that finds if U is A's uncle by blood
uncleblood(U,A):- brother(U,P), parent(P,A).

%Rule that finds if U is B's uncle by marriage
unclemarriage(U,B):- married(U,S), sister(S,A),parent(A,B).

%Rule that finds if A is B's aunt by blood
auntblood(A,B):- sister(A,P), parent(P,B).

%Rule that finds if A is T's aunt by marriage
auntmarriage(A,T):- married(A,B), brother(B,U),parent(U,T).

%Rule that find if G is C's grandparent
grandparent(G,C):- parent(G,A), parent(A,C).

%Rule that finds if F is C's grandfather
grandfather(F,C):- grandparent(F,C), male(F).

%Rule that finds if M is C's grandmother
grandmother(M,C):- grandparent(M,C), female(M).

%Rule that finds if C is G's grandchild
grandchild(C,G):- grandparent(G,C).

%Rule that serves as base case to find if X is Y's ancestor
ancestor(X,Y):- parent(X,Y).

%Rule that is recursive to find if X is Y's ancestor
ancestor(X,Y):- parent(Z,Y), ancestor(X,Z).

%Rule that finds if X is Y's descendant
descendant(Y,X):- ancestor(X,Y).

%Rule that finds if X is older that Y
older(X,Y):- born(X,A), born(Y,B), A < B.

%Rule that finds if X is younger than Y
younger(X,Y):- older(Y,X).

%Rule that finds who was in reign when Y was born
regentWhenBorn(X,Y):- reigned(X,S,E), born(Y,B), B>S, E>B.

% Extra Credit: Rule that determines if X is Y's cousin by seeing if X's
% parent, A, is the sibling of Y's parent, B.
cousin(X,Y):- parent(A,X), parent(B,Y), sibling(A,B).

















