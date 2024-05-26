defmodule PhoenixPaginationWeb.BookLive.Index do
  use PhoenixPaginationWeb, :live_view

  alias PhoenixPagination.Books
  alias PhoenixPagination.Books.Book

  @impl true
  # def mount(params, _session, socket) do
  #   IO.inspect(Books.paginate_books(params))
  #   {:ok, stream(socket, :books, Books.list_books())}
  # end
  def mount(params, _session, socket) do

    books = Books.paginate_books(params).entries
    total_pages = Books.paginate_books(params).total_pages
    page_number = Books.paginate_books(params).page_number
    total_entries = Books.paginate_books(params).total_entries

    # items = socket
    # |> assign(:books, books)
    # |> assign(:total_pages, total_pages)
    # |> assign(:page_number, page_number)
    # |> assign(:total_entries, total_entries)

    {:ok, stream(socket
    |> assign(:books, books)
    |> assign(:total_pages, total_pages)
    |> assign(:page_number, page_number)
    |> assign(:total_entries, total_entries),
    :books,
    books)}
  end

  @impl true
  # def handle_params(params, _url, socket) do
  #   {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  # end

  def handle_params(params, _url, socket) do
    books = Books.paginate_books(params).entries
    total_pages = Books.paginate_books(params).total_pages
    page_number = Books.paginate_books(params).page_number
    total_entries = Books.paginate_books(params).total_entries

    {:noreply,
     socket
     |> assign(:books, books)
     |> assign(:total_pages, total_pages)
     |> assign(:page_number, page_number)
     |> assign(:total_entries, total_entries)
     |> apply_action(socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Book")
    |> assign(:book, Books.get_book!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Book")
    |> assign(:book, %Book{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Books")
    |> assign(:book, nil)
  end

  @impl true
  def handle_info({PhoenixPaginationWeb.BookLive.FormComponent, {:saved, book}}, socket) do
    {:noreply, stream_insert(socket, :books, book)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    book = Books.get_book!(id)
    {:ok, _} = Books.delete_book(book)

    {:noreply, stream_delete(socket, :books, book)}
  end
end
