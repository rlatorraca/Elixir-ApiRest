defmodule Rlsppay.Number do

  def sum_numbers_from_file(filename) do
    file = File.read("#{filename}.csv")
    manipula_arquivo(file)
  end

  defp manipula_arquivo({:ok, file}), do: file
  defp manipula_arquivo({:error, _reason}), do: {:error, "Invalid File !!!"}
end
