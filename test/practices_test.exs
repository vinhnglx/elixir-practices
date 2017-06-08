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

  test "oppsite number" do
    assert Practices.opposite_num(3) == -3
  end

  test "split string to pair of two chars" do
    assert Practices.split_string_pair("vnsg") == ["vn", "sg"]
    assert Practices.split_string_pair("hello") == ["he", "ll", "o_"]
  end
end
