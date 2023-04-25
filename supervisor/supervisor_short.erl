%---MODULE-NAME---(change this comment together with -module().)
-module(module_name).
%---GEN_SERVER---
-behavour(supervisor).

-export([start_link/0, start_link/1]).
-export([init/1]).

-define(INITARGS, []).

start_link() ->
  supervisor:start_link(?MODULE, ?INITARGS).

start_link(SupervisorName) ->
  supervisor:start_link(SupervisorName, ?MODULE, ?INITARGS).

init(_Args) ->
  SupFlags = #{strategy   => one_for_one,
               intensity  => 1,
               period     => 5 },
  ChildSpecs = [
    #{id        => gen_server_module,
      start     => {reg_name, start_link, []},
      restart   => permanent,
      shutdown  => brutal_kill,
      type      => worker,
      modules   => [ch3]} %,
    ],
    {ok, {SupFlags, ChildSpecs}}.
