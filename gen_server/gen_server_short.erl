%---MODULE-NAME---(change this comment together with -module().)
-module(module_name).
%---GEN_SERVER---
-behavour(gen_server).

-export([start_link/0, start_link/1]).
-export([init/1, handle_call/3, handle_cast/2]).

start_link() -> 
  InitArgs = [],
  StartOpts = [],
  gen_server:start_link({local, ?MODULE}, ?MODULE, InitArgs, StartOpts).

start_link(RegisterName) -> 
  InitArgs = [],
  StartOpts = [],
  gen_server:start_link(RegisterName, ?MODULE, InitArgs, StartOpts).

init(InitArgs) ->
  State = InitArgs,
  {ok, State}.

handle_call(_Request, _From, State) ->
  NewState = State,
  {reply, Reply, NewState}.

handle_cast(_Request, State) ->
  NewState = State,
  {noreply, NewState}.
