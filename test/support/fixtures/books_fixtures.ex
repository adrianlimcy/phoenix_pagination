defmodule PhoenixPagination.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixPagination.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        price: 42,
        title: "some title"
      })
      |> PhoenixPagination.Books.create_book()

    book
  end
end
