# Introduction

> Viewing DataMelon

Hello. My name is Jason Goldberger co-founder of DataMelon.io.  Welcome to the first episode of Phoenix from PHX. In these videos we're going to be covering
paradigms, features, and tools for Elixir's Phoenix framework.

Today we are going to create a simple crud (create, read, update, delete) app with data to persistence handled by Postgres.


# Explain Phoenix

> Viewing phoenixframework.org

This is the page for Phoenix. Phoenix is currently on version 0.13. For this video I'm assuming you already have Elixir (at least 1.0) and Erlang/OTP installed. If not go to elixir-lang.org and follow the instructions for installation.

Additionally, to take advantage of all of Phoenix's tool having NodeJS installed is recommended. Phoenix uses brunch.io to build static assets automatically. It's pretty fantastic.


# Install @ phoenixframework.org

> showing cleared console

+ run `$ mix local.hex`
+ run `$ mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v0.13.1/phoenix_new-0.13.1.ez`


First we run mix local.hex which makes sure our hex version is the most current stable release. Then we archive.install phoenix. archive.install allows us to run phoenix's mix tasks without being inside of a cloned of phoenix git repo.

And finally, if you get stuck on anything while programming Elixir, feel free to drop by #elixir-lang channel on irc.freenode.org and ask for help. Everyone is very helpful there.


# Welcome to Phoenix.

> console

+ run `$ mix phoenix.new phx_blog`

Today we are going to make a simple crud application from scratch. Using Elixir's `mix` tool with the task `phoenix.new`, create a new `phx_blog`.

During installation a prompts will ask to automatically fetch and build phoenix's dependencies. Always a good idea.

+ run `mix compile`

Let's run a mix compile. This will compile all the phoenix dependencies. This only has to be done once at the initial project setup.

We now have a working Phoenix app, but right now it doesn't do much.
If we run 'iex -S mix phoenix.server' and visit `localhost:4000` we'll get a Phoenix server with a single (default) page.

# Phoenix Generators

> console

Alright. Let's get down to business.

The fastest way to create a CRUD resource in Phoenix is to use Phoenix's generators. We're going to use a generator to create an html resource, a model, and all associated controllers, views, templates, and tests.

+ `$ mix phoenix.gen.html Post post title:string body:string tags:array:string`


# Configing Phoenix for postgres

Lets follow the in-console instructions.

+ `$ resources "/post", PostController`
+ `$ mix ecto.migrate`

Unfortunately, the defaults for phoenix won't work out-of-the-box on my system. Phoenix's defaults for user 'postgres' have the password 'postgres'; on my system that is not the case. So... We are going to configure Phoenix to login as a custom user.

# Change dev.exs

> Showing file `dev.exs`

+ change dev.exs and test.exs config to match:

``` elixir

username: "phx_user",
password: "password",

```
# Set up Postgres

> showing console

+ `$ sudo su postgres`
+ enter password
+ `$ psql`
+ `=# create role phx_user with password 'password';`
+ `=# alter role phx_user with login;`
+ `=# alter role phx_user with createdb;`
+ `=# \q`
+ `$ exit`

# Ecto

 + Run `ecto.create` and `ecto.migrate`

# Look at generated ecto file

> Show priv/repo/migrations/whatever file








