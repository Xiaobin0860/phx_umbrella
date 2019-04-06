defmodule PhxWeb.PageControllerTest do
  use PhxWeb.ConnCase

  test "GET /phx", %{conn: conn} do
    conn = get(conn, "/phx")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
