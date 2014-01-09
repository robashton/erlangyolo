-module(hello).

-export([ lol/1, init/0, debug/2, start_debug/0 ]).

init() ->
  {ok, Pid} = calculator:start_link(bob),
  Pid.

lol(Pid) ->
  MyName = rob,
  HisName = <<"Mark">>,
  io:format("lol 1"),
  io:format("lol 2"),
  io:format("lol 3"),
  something(),
  Pid ! { add, 5 },
  io:format("lol 4").

something() ->
  io:format("do something").

start_debug() ->
  i:im(),
  i:iaa([break]).

debug(Module, Line) ->
  c:c(Module, [debug_info]),
  i:ii(Module),
  i:ib(Module, Line).
