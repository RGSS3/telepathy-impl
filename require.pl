:-module(require, [
    run/1,
    run/2,
    rgit/2, 
    rgit/3, 
    github/1, 
    github/2]).

:- use_module(library(git)).
mkdir(A) :- exists_directory(A), !; make_directory(A).

run(Fmt, Arg) :-
    format(string(Line), Fmt, Arg),
    shell(Line).

run(Str) :-
    shell(Str).


gitfolder(Name, Dir) :-
    format(string(Dir), 'git/~s', [Name]).

rgit(_, Name) :-
    gitfolder(Name, Dir),
    exists_directory(Dir),
    is_git_directory(Dir),
    !.

rgit(Header, Name) :-
    mkdir("git"),
    run('git clone ~s/~s git/~s', [Header, Name, Name]).

rgit(Header, A, B) :- 
    format(atom(C), '~s/~s', [A, B]),
    git(Header, C).

github(Name) :- rgit('https://github.com', Name).
github(A, B) :- rgit('https://github.com', A, B).

