defmodule LoadLists do
    def fill_item_list(file_path) do
        File.stream!(file_path) 
        |> Stream.map(&String.trim/1)
        |> Stream.map(&MapUtils.return_map/1)
        |> Enum.to_list
    end

    def fill_email_list(file_path) do
        File.stream!(file_path) 
        |> Stream.map(&String.trim/1)
        |> Enum.to_list
    end
end