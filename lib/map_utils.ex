defmodule MapUtils do 
    def return_map(string) do
        splited_string = String.split(string, ";")
        %{:item => Enum.at(splited_string, 0), :quantity => Enum.at(splited_string, 1), :price => Enum.at(splited_string, 2)}
    end

  def concatanate_map_list([map_list_head | map_list_tail]) do
    Map.merge(map_list_head, concatanate_map_list(map_list_tail))
  end

  def concatanate_map_list([]) do
    %{}
  end
end