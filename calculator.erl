-module(calculator).
-behaviour(gen_server).

-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, { current_value }).

start_link(Name) ->
  gen_server:start_link({local, Name}, calculator, [], []).

init([]) ->
  { ok, #state{ current_value = 0 } }.

handle_call(not_implemented, _From, State) ->
  {reply, ok, State}.

handle_cast(not_implemented, State) ->
  {noreply, State}.

handle_info({ add, Value }, State = #state { current_value = CurrentValue }) ->
  io:format(user, "The new value is ~p ~n", [ CurrentValue + Value ]),
  { noreply, State#state{ current_value = CurrentValue + Value }};

handle_info({ minus, Value }, State = #state { current_value = CurrentValue }) ->
  io:format(user, "The new value is ~p ~n", [ CurrentValue - Value ]),
  { noreply, State#state{ current_value = CurrentValue - Value }}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.


