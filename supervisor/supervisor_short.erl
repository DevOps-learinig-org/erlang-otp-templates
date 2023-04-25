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
  SupFlags = #{strategy   => one_for_one, % optional: one_for_one, one_for_all, rest_for_one, simple_one_for_one
               intensity  => 1,           % optional, default = 1
               period     => 5,           % optional, default = 5, means 1 restart per 5 sec 
               auto_shutdown = never },   % optional: never, any_significant
  ChildSpecs = [
    #{id        => gen_server_module,
      start     => {reg_name, start_link, []}, 
      restart   => permanent, % permanent, temporary, transient
      shutdown  => brutal_kill,
      type      => worker,
      modules   => [ch3]} %,
    ],
    {ok, {SupFlags, ChildSpecs}}.
