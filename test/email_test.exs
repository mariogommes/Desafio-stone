defmodule EmailTest do
  use ExUnit.Case
  doctest Email

  test "return only valid emails from email list" do
    email_list = ["email@email.com", "email@email.com.br", "", "e-mail", "email#email.com", "email@email.com.eu", "", "", ""]
    assert Email.filter_email_list(email_list) == ["email@email.com", "email@email.com.br", "email@email.com.eu"]
  end

end
