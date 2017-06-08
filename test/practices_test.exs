defmodule PracticesTest do
  use ExUnit.Case
  doctest Practices

  test "count no of duplicates in a word" do
    {:ok, result} = Practices.count_duplicates({:string, "helloworld"})
    assert result == 2

    {:error, error} = Practices.count_duplicates(1111)
    assert error == {:not_a_string, 1111}
  end
end
