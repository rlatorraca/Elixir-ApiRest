defmodule Rlsp.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :age, :email, :password, :nickname]

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password, :string, vritual: true
    field :password_hash, :string
    field :nickname, :string
  end

  # faz as validacoes na insercao no DB
  # mapeia dos dados
  def changeset(params) do
    %__MODULE__{}
      |> cast(params, @required_params)
      |> validate_required(@required_params)
      |> validate_length(:password, min: 6)
      |> validate_number(:age, greater_than_or_equal_to: 18)
      |> validate_format(:email, ~r/@/)
      |> unique_constraint([:eamail])
      |> unique_constraint({:nickname})
      |> put_password_hash()
  end

  # Faz a criptografia do password
  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end