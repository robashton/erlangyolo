-module(hello).

-export([
         lol/0
        ]).

lol() ->
  MyName = rob,
  HisName = <<"Mark">>,
  io:format("lol 1"),
  io:format("lol 2"),
  io:format("lol 3"),
  something(),
  io:format("lol 4").

something() ->
  io:format("do something").
