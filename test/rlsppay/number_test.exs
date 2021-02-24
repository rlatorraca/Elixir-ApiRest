defmodule Rlsppay.NumberTest do
  use ExUnit.Case

  alias Rlsppay.Number

  # Descreve a funcao a ser testada
  describe "sum_numbers_from_file/1" do
    test "Given a correct file, returns the sum of all numbers existed in that file" do
      response = Number.sum_numbers_from_file("numbers")

      expected_response = {:ok, %{file: 511}}
      assert response == expected_response
    end

    test "Given a wrong file, returns a error message" do
      response = Number.sum_numbers_from_file("nonExisting")

      expected_response = {:error, %{message: "Invalid File !!!"}}
      assert response == expected_response
    end
  end
end
