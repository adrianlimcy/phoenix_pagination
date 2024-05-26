# PhoenixPagination

Testing Scrivener on Phoenix
Tutorial found in:
https://medium.com/@michaelmunavu83/streamlining-pagination-in-phoenix-live-view-with-scrivener-5ceb6e6fe642

Steps:
1. mix phx.new phoenix_pagination
2. cd phoenix_pagination
3. mix ecto.create
4. mix phx.gen.live Books Book books title:string price:integer
  - copy and paste the routes into router
  - mix ecto.migrate
5. create seeds in seeds.exs
6. mix run priv/repo/seeds.exs
7. add {:scrivener_ecto, "~> 2.7"} to mix.exs within defp deps
8. mix deps.get
9. set use Scrivener, page_size: 5 in lib/phoenix_pagination/repo.ex
10. create function in lib/phoenix_pagination/books.ex
  - def paginate_books
11. modify lib/phoenix_pagination_web/live/index.ex in def mount sockets
12. modify the index.html.heex file to display pagination
  - use .link navigate, not .link patch