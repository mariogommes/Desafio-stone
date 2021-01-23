defmodule Desafio do
  @moduledoc """
  Documentation for `Desafio`.
  """

  @doc """
  main.

  Inicializa uma lista de tens e uma lista de emails carregadas de 2 arquivos
  para serem usados como argumentos na função calculate, que é chamada dentro 
  da função main.

  ## Examples

      #iex> Desafio.main
      #%{"email1@email.com" => 33, "email2@email.com" => 33, "email3@email.com" => 34}

      #iex> Desafio.main(5,2)
      #%{"email1@email.com" => 86479, "email2@email.com" => 86479}

  """
  def main do
    item_list = LoadLists.fill_item_list("listas/items.txt")
    email_list = LoadLists.fill_email_list("listas/emails.txt")
    calculate(item_list, email_list)
  end

  def main(item_list_size, email_list_size, show_lists \\ false) when is_integer(item_list_size) and is_integer(email_list_size) and is_boolean(show_lists) do
    item_list = Enum.to_list(GenerateLists.generate_item_list(item_list_size))
    email_list = GenerateLists.generate_email_list(email_list_size)
    if show_lists do
      IO.puts("Item list")
      IO.inspect(item_list)
      IO.puts("email list")
      IO.inspect(email_list)
    end
    calculate(item_list, email_list)
  end

  def calculate_total_value([item_head | item_tail]) do
    cond do
      item_head[:item] != "" ->
        String.to_integer(item_head[:price]) * String.to_integer(item_head[:quantity]) + calculate_total_value(item_tail)
      item_head[:item] == "" ->
        calculate_total_value(item_tail)
    end
  end

  def calculate_total_value([]) do
    0
  end

  defp choose_greater_quota_payer(map_list, email_quota_map, email_list, total) do
    greater_quota_index = Enum.random(0..length(email_list) - 1)
    remainder = get_remainder(total, length(email_list))

    cond do
      email_quota_map != %{} ->
        Map.update!(email_quota_map, Enum.at(Map.keys(Enum.at(map_list, greater_quota_index)),0), fn x -> x + remainder end)
      email_quota_map == %{} ->
        %{}
    end
  end

  def get_quota(total, length_email_list) when is_integer(total) and is_integer(length_email_list) do
    cond do
      length_email_list == 0 ->
        0
      length_email_list != 0 ->
        div(total, length_email_list)
    end
  end

  def get_remainder(total, length_email_list) when is_integer(total) and is_integer(length_email_list) do
    cond do
      length_email_list == 0 ->
        0
      length_email_list != 0 ->
        rem(total, length_email_list)
    end
  end

  def calculate(item_list, email_list) when is_list(item_list) and is_list(email_list) do
    email_list = Email.filter_email_list(email_list)
    total = calculate_total_value(item_list)
    quota = get_quota(total, length(email_list))

    map_list = email_list |> Enum.map(fn x -> Map.put(%{}, x, quota) end)
    email_quota_map = map_list |> MapUtils.concatanate_map_list
    email_quota_map = choose_greater_quota_payer(map_list, email_quota_map, email_list, total)
    email_quota_map
  end
end