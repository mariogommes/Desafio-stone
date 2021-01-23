defmodule GenerateListsTest do
    use ExUnit.Case
    doctest GenerateLists

    test "generate the proper number of items" do
        assert length(GenerateLists.generate_item_list(5)) == 5 
    end

    test "generate the proper number of emails" do
        assert length(GenerateLists.generate_email_list(5)) == 5 
    end
end
