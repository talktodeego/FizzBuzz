defmodule FizzBuzz do
  # FAZ A LEITURA DO ARQUIVO
  def build(file_name) do
    # NOME DO ARQUIVO
    file_name
    # LEIO O ARQUIVO
    |> File.read()
    # LIDO COM O ARQUIVO
    |> handle_file_read()
  end

  # SE A LEITURA DO ARQUIVO DER SUCESSO
  defp handle_file_read({:ok, result}) do
    result =
      result
      # VOU SEPARAR A MINHA STRING
      |> String.split(",")
      # E CONVERTER CADA ELEMENTO DA STRING
      |> Enum.map(&convert_and_evaluate_number/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  # FUNÇÃO PARA CONVERTER NÚMEROS EM INTEIROS
  defp convert_and_evaluate_number(elem) do
    elem
    # CADA ELEMENTO VAI CONVERTER PRA INTEIRO
    |> String.to_integer()
    # VERIFICAR SE O NUMERO É INTEIRO
    |> evaluate_number()
  end

  # FUNÇÃO QUE FAZ A SEPARAÇÃO DOS NÚMEROS QUE VÃO RECEBER FIZZ, BUZZ E FIZZBUZZ
  defp evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number
end
