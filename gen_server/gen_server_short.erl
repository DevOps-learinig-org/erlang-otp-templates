%---MOD-NAME---(change this comment together with -module().)
-module(mod_name).
%---GEN-SERVER---
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

init() ->
  {ok,State}.
