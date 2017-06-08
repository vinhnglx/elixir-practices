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

  test "leet code" do
    assert Practices.to_let_speak("Hello") == "#3110"
  end

  test "accum" do
    assert Practices.accum("vincent") == "V-Ii-Nnn-Cccc-Eeeee-Nnnnnn-Ttttttt"
  end

  test "two oldest element from a list" do
    assert Practices.two_oldest_elements([3,4,5,100,30]) == [30,100]
  end

  test "revert invert" do
    assert Practices.revert_invert([1,40,"a", "vincent", -99, 4, 0]) == [-1, -4, 99, -4, 0]
  end

  test "get middle of word" do
    assert Practices.get_middle("Interesting") == "e"
    assert Practices.get_middle("JohnDoe") == "n"
  end

  test "count monkey" do
    assert Practices.count_monkeys(3) == [1,2,3]
  end

  test "add length for each word in a string" do
    assert Practices.add_length("Hello world! I'm Vincent") == ["Hello 5", "world! 6", "I'm 3", "Vincent 7"]
  end

  test "to camel case" do
    assert Practices.to_camel_case("the-limitation") == "theLimitation"
    assert Practices.to_camel_case("John_Doe_is_a_man") == "JohnDoeIsAMan"
  end

  test "a list is a substring of another list" do
    assert Practices.lexicographical_sorted_list(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
  end
end
