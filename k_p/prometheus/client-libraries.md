# Prometheus Client Library

Before you can monitor your services, you need to add instrumentation to their code via one of the Prometheus client libraries. These implement the Prometheus metric types.

## References

<https://prometheus.io/docs/instrumenting/clientlibs/>

## CLIENT LIBRARIES

Choose a Prometheus client library that matches the language in which your application is written. This lets you define and expose internal metrics via an HTTP endpoint on your application’s instance:

Go
Java or Scala
Python
Ruby
Rust
Unofficial third-party client libraries:

Bash
C
C++
Common Lisp
Dart
Delphi
Elixir
Erlang
Haskell
Lua for Nginx
Lua for Tarantool
.NET / C#
Node.js
OCaml
Perl
PHP
R
When Prometheus scrapes your instance's HTTP endpoint, the client library sends the current state of all tracked metrics to the server.

If no client library is available for your language, or you want to avoid dependencies, you may also implement one of the supported exposition formats yourself to expose metrics.

When implementing a new Prometheus client library, please follow the guidelines on writing client libraries. Note that this document is still a work in progress. Please also consider consulting the development mailing list. We are happy to give advice on how to make your library as useful and consistent as possible.
