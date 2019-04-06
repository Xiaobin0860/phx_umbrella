defmodule PhxWeb.UserControllerTest do
  use PhxWeb.ConnCase

  alias Phx.Accounts

  @create_attrs %{
    email: "mail@foxmail.com",
    password: "some password",
    password_confirmation: "some password"
  }
  @invalid_attrs %{email: nil, password: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      ret_conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)
      assert %{"jwt" => jwt} = json_response(ret_conn, 200)

      ret_conn =
        conn
        |> put_req_header("authorization", "Bearer " <> jwt)
        |> get(Routes.user_path(conn, :show))

      assert %{"id" => _id, "email" => email} = json_response(ret_conn, 200)
      assert @create_attrs.email == email
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
