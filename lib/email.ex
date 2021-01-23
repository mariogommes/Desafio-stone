defmodule Email do
    defp is_email?(string) do
        String.match?(string, ~r/^[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?$/)
    end

    def filter_email_list(email_list) when is_list(email_list) do
        Enum.map(email_list, fn x -> if is_email?(x), do: x, else: [] end) |> List.flatten
    end
end