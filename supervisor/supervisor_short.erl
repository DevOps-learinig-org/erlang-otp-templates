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
  SupervisorFlags = #{strategy   => one_for_one, % optional: one_for_one | one_for_all | rest_for_one | simple_one_for_one
               intensity  => 1,           % optional, default = 1
               period     => 5,           % optional, default = 5, means 1 restart per 5 sec 
               auto_shutdown = never },   % optional: never | any_significant | all_significant
  ChildSpecs = [
    #{id        => reg_id,
      start     => { module, start_link, [] }, % { Mod, Fun, Args }
      restart   => permanent,   % optional: permanent | temporary | transient
      shutdown  => brutal_kill, % optional: brutal_kill | timeout()
      significant => false,     % optional: boolean() if true then auto_shutdown \= never and restart \= permanent
      type      => worker %,    % optional: worker | supervisor
      % modules   => [module]} %,  % optional: used by the release handler during upgrades and downgrades
    ],
    {ok, {SupervisorFlags, ChildSpecs}}.
