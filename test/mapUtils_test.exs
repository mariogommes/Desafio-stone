defmodule MapUtilsTest do
    use ExUnit.Case
    doctest MapUtils

    test "return map from semicolon delimited string" do
        assert MapUtils.return_map("item1;2;2000") == %{:item => "item1", :quantity => "2", :price => "2000"}
    end

    test "convert list of maps in a map" do
        list_of_maps = [%{:a => 1}, %{:b => 2}, %{:c => 3}]
        assert MapUtils.concatanate_map_list(list_of_maps) == %{:a => 1, :b => 2, :c => 3}
    end

end