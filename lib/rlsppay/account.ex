defmodule Rlsppay.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rlsppay.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User
    timestamps()
  end

  # faz as validacoes na insercao no DB
  # mapeia dos dados
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
      |> cast(params, @required_params)
      |> validate_required(@required_params)
      |> check_constraint(:balance, name: :balance_must_be_positve_or_zero)
  end


end
