-module(hello_erlang_app).
-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

%% Supervisor callbacks
-export([init/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() ->
    application:start(hello_erlang).

start(_StartType, _StartArgs) ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

stop(_State) ->
    ok.

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
  {ok, {{one_for_one, 1000, 3600}, [
    {hello_erlang, {hello_erlang, start_link, []}, permanent, 2000, worker, [hello_erlang]}
  ]}}.
