defmodule GenerateLists do
    def generate_item_list(num_items) when num_items > 0 do  
        [%{:item => "item" <> Integer.to_string(num_items), :quantity => Integer.to_string(Enum.random(1..100)), :price => Integer.to_string(Enum.random(100..1000))}] ++ generate_item_list(num_items - 1)
    end

    def generate_item_list(num_items) when num_items == 0 do
        []
    end

    def generate_email_list(num_emails) when num_emails > 0 do
        ["email" <> Integer.to_string(num_emails) <> "@email.com"] ++ generate_email_list(num_emails - 1)
    end

    def generate_email_list(num_emails) when num_emails == 0 do
        []
    end

end