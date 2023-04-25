%---MODULE-NAME---(change this comment together with -module().)
-module(module_name).
%---GEN_SERVER---
-behavour(gen_server).

-export([start_link/0, start_link/1]).
-export([init/1, handle_call/3, handle_cast/2]).

-define(INITARGS, []).
-define(STARTOPTS, []).

start_link() ->
  gen_server:start_link(?MODULE, ?INITARGS, ?STARTOPTS).

start_link(RegisterName) ->
  gen_server:start_link(
    RegisterName, ?MODULE, ?INITARGS, ?STARTOPTS
  ).
% {ok, Pid :: pid()} | ignore | {error, Reason :: term()}

init(InitArgs) ->
  State = InitArgs,
  {ok, State}.
% {ok,State} | {ok,State,_} | {ok,_,Timeout} | {ok,_,hibernate} | {ok,_,{continue,Continue}}
% {stop,Reason}
% ignore

handle_call(_Request, _From, State) ->
  Reply = ok,
  NewState = State,
  {reply, Reply, NewState}.
% {reply,Reply, NewState}
%  | {reply,Reply,NewState,Timeout}
%  | {reply,Reply,NewState,hibernate}
%  | {reply,Reply,NewState,{continue,Continue}}
%  | {noreply,NewState}
%  | {noreply,NewState,Timeout}
%  | {noreply,NewState,hibernate}
%  | {noreply,NewState,{continue,Continue}}
%  | {stop,Reason,Reply,NewState}
%  | {stop,Reason,NewState}

handle_cast(_Request, State) ->
  NewState = State,
  {noreply, NewState}.
% {noreply,NewState}
%  | {noreply,NewState,Timeout}
%  | {noreply,NewState,hibernate}
%  | {noreply,NewState,{continue,Continue}}
%  | {stop,Reason,NewState}
