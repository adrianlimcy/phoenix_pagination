# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixPagination.Repo.insert!(%PhoenixPagination.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhoenixPagination.Books

books = [
  %{title: "book 1",
    price: 10
  },
  %{title: "book 2",
    price: 20
  },
  %{title: "book 3",
    price: 30
  },
  %{title: "book 4",
    price: 40
  },
  %{title: "book 5",
    price: 50
  },
  %{title: "book 6",
    price: 60
  },
  %{title: "book 7",
    price: 70
  },
  %{title: "book 8",
    price: 80
  },
  %{title: "book 9",
    price: 90
  },
  %{title: "book 10",
    price: 100
  },
  %{title: "book 11",
    price: 10
  },
  %{title: "book 12",
    price: 20
  },
  %{title: "book 13",
    price: 30
  },
  %{title: "book 14",
    price: 40
  },
  %{title: "book 15",
    price: 50
  },
  %{title: "book 16",
    price: 60
  },
  %{title: "book 17",
    price: 70
  },
  %{title: "book 18",
    price: 80
  },
  %{title: "book 19",
    price: 90
  },
  %{title: "book 20",
    price: 100
  }
]

Enum.each(books, fn(data)->
  Books.create_book(data)
end)
