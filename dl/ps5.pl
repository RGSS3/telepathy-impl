:- module(ps5, [download/2, install/0]).
:- use_module(require).

download(In, Out) :-
    run('powershell -c "Invoke-WebRequest ~s -OutFile ~s"', [In, Out]).

install:-
    shell('powershell -c "Get-Command Invoke-WebRequest"'),
    assertz(download:tpdownload(ps5:download)).

install :- !.

:- initialization(install, now).