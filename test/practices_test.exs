defmodule PracticesTest do
  use ExUnit.Case
  doctest Practices

  test "count no of duplicates in a word" do
    {:ok, result} = Practices.count_duplicates({:string, "helloworld"})
    assert result == 2

    {:error, error} = Practices.count_duplicates(1111)
    assert error == {:not_a_string, 1111}
  end

  test "repeat string base on the number" do
    empty_result = Practices.string_repeat(0, "God")
    assert empty_result == ""

    result = Practices.string_repeat(3, "God")
    assert result == "GodGodGod"
  end
end
