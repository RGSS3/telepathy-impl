:- module(aria2, [download/2, install/0]).
:- use_module(require).

download(In, Out) :-
    run('aria2c ~s ~s"', [In, Out]).

install:-
    shell('aria2c'),
    assertz(download:tpdownload(aria2:download)).

install :- !.

:- initialization(install, now).