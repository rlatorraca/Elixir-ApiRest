defmodule Rlsppay.Number do

  def sum_numbers_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> manipula_arquivo()
  end

  defp manipula_arquivo({:ok, file}), do: file
  defp manipula_arquivo({:error, _reason}), do: {:error, "Invalid File !!!"}
end
