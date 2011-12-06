-module(hello_erlang).
-export([loop/1, start_link/0]).

start_link() ->
    Port = list_to_integer(os:getenv("PORT")),
    io:format("start web server on port ~p~n", [Port]),
    Options = [{ip, "0.0.0.0"},
               {port, Port},
               {backlog, 1024},
               {loop, {?MODULE, loop}}],
    mochiweb_http:start(Options).

loop(Req) ->
    io:format("Serve request for ~p ~p~n", [Req:get(method), Req:get(path)]),
    Req:respond({200, [], <<"Hello world from Erlang.\n">>}).
