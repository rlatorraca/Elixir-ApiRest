defmodule Rlsppay.Number do

  def sum_numbers_from_file(filename) do
    "#{filename}.csv"
      |> File.read()
      |> manipula_arquivo()
  end

  #defp manipula_arquivo({:ok, file}), do: file
  defp manipula_arquivo({:error, _reason}), do: {:error, %{message: "Invalid File !!!"}}

  defp manipula_arquivo({:ok, file}) do
    file = file
     |> String.split(",")
     |> Stream.map(fn number -> String.to_integer(number) end)
     |> Enum.sum()

    {:ok, %{file: file}}
  end
end
