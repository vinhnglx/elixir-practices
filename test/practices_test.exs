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

  test "valid user_name" do
    assert Practices.valid_user_name?("vincent") == true
    assert Practices.valid_user_name?("vin") == false
    assert Practices.valid_user_name?("vinvinvinvinvinvinvinvinvinivnivni") == false
    assert Practices.valid_user_name?("vin@234!3$") == false
    assert Practices.valid_user_name?("vincent_nguyen") == true
  end

  test "is the string uppercase" do
    assert Practices.upper_case?("hello I AM DONALD") == false
    assert Practices.upper_case?("ACSKLDFJSgSKLDFJSKLDFJ") == false
    assert Practices.upper_case?("HELLO I AM DONALD") == true
    assert Practices.upper_case?("M") == true
    assert Practices.upper_case?("ACSKLDFJSGSKLDFJSKLDFJ") == true
  end

  test "two to one longest string" do
    assert Practices.longest("xyaabbbccccdefww", "xxxxyyyyabklmopq") == "abcdefklmopqwxy"
    assert Practices.longest("abcdefghijklmnopqrstuvwxyz", "abcdefghijklmnopqrstuvwxyz") == "abcdefghijklmnopqrstuvwxyz"
  end

  test "length list" do
    assert Practices.length_list_non_tail([1,2,3]) == 3
    assert Practices.length_list_non_tail([]) == 0

    assert Practices.length_list_tail([1,2,3,4,5]) == 5
    assert Practices.length_list_tail([1]) == 1
    assert Practices.length_list_tail([]) == 0
  end

  test "range" do
    assert Practices.range_non_tail(3,6) == [3,4,5,6]
    assert Practices.range_non_tail(4,4) == [4]

    assert Practices.range_tail([], 3, 9) == [3,4,5,6,7,8,9]
    assert Practices.range_tail([], 3, 3) == [3]
  end

  test "positive" do
    assert Practices.positive_non_tail(["a", -1, 2, 3, 5, -3]) == [2,3,5]
    assert Practices.positive_non_tail([]) == []

    assert Practices.positive_tail(["a", "b", -1, 2, 3]) == [2,3]
    assert Practices.positive_tail([]) == []
  end

  test "length of the line from a file" do
    assert Practices.lines_length('./test/sample_data.txt') == %{"line 1" => 11, "line 2" => 18}
  end

  test "length of longest line from a file" do
    assert Practices.longest_line_length('./test/sample_data.txt') == 18
  end

  test "content of longest line from a file" do
    assert Practices.content_longest_line('./test/sample_data.txt') == "My name is Vincent"
  end

  test "word count per line from a file" do
    assert Practices.words_per_line('./test/sample_data.txt') == [2,4]
  end
end
