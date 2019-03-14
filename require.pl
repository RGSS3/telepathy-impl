:-module(require, [
    run/1,
    run/2,
    git/2, 
    git/3, 
    github/1, 
    github/2]).

mkdir(A) :- exists_directory(A), !; make_directory(A).

run(Fmt, Arg) :-
    format(string(Line), Fmt, Arg),
    shell(Line).

run(Str) :-
    shell(Str).

git(_, Name) :-
    format(string(Dir), 'git/~s', [Name]),
    exists_directory(Dir),
    working_directory(Old, Dir),
    run('git status', []), 
    working_directory(_, Old),
    !.

git(Header, Name) :-
    mkdir("git"),
    run('git clone ~s/~s git/~s', [Header, Name, Name]).

git(Header, A, B) :- 
    format(atom(C), '~s/~s', [A, B]),
    git(Header, C).

github(Name) :- git('https://github.com', Name).
github(A, B) :- git('https://github.com', A, B).

