defmodule Phx.AccountsTest do
  use Phx.DataCase

  alias Phx.Accounts

  describe "users" do
    alias Phx.Accounts.User
    alias A

    @valid_attrs %{email: "mail@foxmail.com", password: "some password"}
    @create_attrs %{
      email: "mail@foxmail.com",
      password: "some password",
      password_confirmation: "some password"
    }
    @update_attrs %{email: "updated@foxmail.com", password: "some updated password"}
    @invalid_attrs %{email: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@create_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      u1 = user_fixture()
      [u2] = Accounts.list_users()
      assert u1.id == u2.id
      assert u1.email == u2.email
      assert true == Argon2.verify_pass(u1.password, u1.password_hash)
    end

    test "get_user!/1 returns the user with given id" do
      u1 = user_fixture()
      u2 = Accounts.get_user!(u1.id)
      assert u1.email == u2.email
      assert true == Argon2.verify_pass(u1.password, u1.password_hash)
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@create_attrs)
      assert user.email == @valid_attrs.email
      assert true == Argon2.verify_pass(@valid_attrs.password, user.password_hash)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == @update_attrs.email
      assert true == Argon2.verify_pass(@update_attrs.password, user.password_hash)
    end

    test "update_user/2 with invalid data returns error changeset" do
      u1 = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(u1, @invalid_attrs)
      u2 = Accounts.get_user!(u1.id)
      assert u1.email == u2.email
      assert true == Argon2.verify_pass(u1.password, u1.password_hash)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
