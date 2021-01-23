defmodule DesafioTest do
  use ExUnit.Case
  doctest Desafio

  test "correct total value" do
    item_list = [%{:item => "item1", :quantity => "2", :price => "25"}, %{:item => "item2",:quantity => "1", :price => "25"}, %{:item => "item3", :quantity => "1", :price => "25"}]
    assert Desafio.calculate_total_value(item_list) == 100
  end

  test "correct map output for same quota division" do
    item_list = [%{:item => "item1", :quantity => "2", :price => "25"}, %{:item => "item2",:quantity => "1", :price => "25"}, %{:item => "item3", :quantity => "1", :price => "25"}]
    email_list = ["email1@email.com", "email2@email.com", "email3@email.com", "email4@email.com"]
    assert Desafio.calculate(item_list, email_list) == %{"email1@email.com" => 25, "email2@email.com" => 25, "email3@email.com" => 25, "email4@email.com" => 25}
  end

  test "divide by zero to get remainder returns zero" do
    assert Desafio.get_remainder(2,0) == 0
  end

  test "divide by zero to get quota returns zero" do
    assert Desafio.get_quota(2,0) == 0
  end

end
