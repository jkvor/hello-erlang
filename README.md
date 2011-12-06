### Hello world Erlang web app

To build and run:

    $ rebar get-deps compile
    $ foreman start
    19:11:36 web.1     | started with pid 54986
    19:11:36 web.1     | start web server on port 5000

    $ curl http://127.0.0.1:5000/
    Hello world from Erlang.

    ^CSIGINT received
    19:11:46 system    | terminating
    19:11:46 system    | killing web in pid 54986
    19:11:46 web.1     | process exiting
    19:11:46 web.1     | process terminated
    19:11:46 system    | terminating
