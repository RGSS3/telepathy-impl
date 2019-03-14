:- module(download, [dl/2, tpdownload/1]).
:- use_module(require).

tpdownload([]).

dl(In, Out):-
    tpdownload(A), A \= [], !,
    call(A, In, Out).

install :-
    use_module('dl/aria2', []),
    use_module('dl/ps5', []).
:- initialization(install, now).