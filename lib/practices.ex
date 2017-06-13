defmodule Practices do
  @moduledoc """
  Documentation for Practices.
  """

  @doc """
    Count no of duplicates

    ## Example

        iex > Practices.count_duplicates({:string, "abABcdef"})
        {:ok, 2} # a,b
        iex > Practices.count_duplicates({:string, "impossible"})
        {:ok, 2} # i,s
        iex > Practices.count_duplicates(1111)
        {:error, {:not_a_string, 1111}}
  """
  def count_duplicates({:string, str}) do
    {:ok, str
      |> String.downcase()
      |> String.split("", trim: true)
      |> Enum.group_by(fn(x) -> x end)
      |> Enum.count(fn({_key, value}) -> value |> Enum.count() > 1 end)}
  end
  def count_duplicates(unknown) do
    {:error, {:not_a_string, unknown}}
  end

  @doc """
    String repeat

    ## Example

      iex > Practices.string_repeat(2, "Hello")
      HelloHello
      iex > Practices.string_repeat(0, "Vb")
      ""
  """
  def string_repeat(number, _str) when number < 0 or number === 0 do
    ""
  end
  def string_repeat(number, str) when number > 0 do
    str |> String.duplicate(number)
  end

  @doc """
    Opposite number

    ## Example

      iex > Practices.opposite_num(2)
      -2
      iex > Practices.opposite_num(-2)
      2
  """
  def opposite_num(number) do
    number * -1
  end

  @doc """
    Split String to pair of two chars


    ## Example

      iex > Practices.split_string_pair("abc")
      ["ab", "c_"]
      iex > Practices.split_string_pair("def12")
      ["de", "f1", "2_"]
      iex > Practices.split_string_pair("abcdef")
      ["ab", "cd", "ef"]
  """
  def split_string_pair(str) do
    str_list = str |> String.downcase |> String.codepoints

    str_length = str |> String.length

    case str_length |> rem(2) === 0 do
      true -> str_list |> Enum.chunk(2) |> Enum.map(fn(x) -> x |> Enum.join() end)
      false -> str_list |> List.insert_at(-1, "_") |> Enum.chunk(2) |> Enum.map(fn(x) -> x |> Enum.join() end)
    end
  end


  @doc """
    Converts a regular english sentence to Leetspeak.
    Consider only uppercase letters (no lowercase letters, no numbers) and spaces

    ## Example

      iex > Practices.to_let_speak("VINCENT")
      V!N(3N7
      iex > Practices.to_let_speak("vincent nguyen")
      V!N(3N7 N6UY3N
  """
  @eet_code %{ A: '@', B: '8', C: '(', D: 'D', E: '3', F: 'F', G: 6, H: '#', I: '!', J: 'J', K: 'K', L: 1, M: 'M',
            N: 'N', O: '0', P: 'P', Q: 'Q', R: 'R', S: '$', T: '7', U: 'U', V: 'V', W: 'W', X: 'X', Y: 'Y', Z: '2', " ": " "}

  def to_let_speak(str) do
    Enum.join(
      Enum.map(
        str
          |> String.upcase
          |> String.codepoints,
        fn(x) ->
          @eet_code[x |> String.to_atom]
        end
      )
    )
  end

  @doc """
    Accum. Duplicate characters based on index

    ## Example

      iex > Practices.accum "abcd"
      A-Bb-Ccc-Dddd
  """
  def accum(str) do
    Enum.map(
      str
        |> String.codepoints
        |> Enum.with_index(1),
      fn(x) ->
        elem(x, 0) |> String.duplicate(elem(x,1)) |> String.capitalize
      end
    ) |> Enum.join("-")
  end

  @doc """
    Two oldest elements from List

    ## Example

      iex > Practices.two_oldest_elements([1,4,5,6,8])
      [6,8]
      iex > Practices.two_oldest_elements([3,5,100,30,0])
      [30, 100]
  """
  def two_oldest_elements(list) do
    [List.delete(list, list |> Enum.max) |> Enum.max, list |> Enum.max]
  end

  @doc """
    Reverse and invert all integer values in a given list.

    ## Example

      iex > Practices.revert_invert([1,20, 'a', 3.4, 92, -245, 50])
      [-1, -2, -29, 542, -5]
  """
  def revert_invert(list) do
    list
      |> Enum.filter(
        fn(x) -> is_integer x end
      )
      |> Enum.map(
        fn(x) ->
          x
            |> to_string
            |> String.reverse
        end
      )
      |> Enum.map(
        fn(x) ->
          if x |> String.contains?("-") do
            x |> String.strip(?-) |> String.replace_prefix("", "-") |> String.to_integer
          else
            x |> String.to_integer
          end
        end
      )
      |> Enum.map(
        fn(x) ->
          x * -1
        end
      )
  end

  @doc """
    Get the middle character of a word.
    If word's length is odd then return a middle character
    if word's length is even then return two middle characters

    ## Example

      iex > Practices.get_middle("vincent")
      "c"
      iex > Practices.get_middle("john")
      "oh"
  """
  def get_middle(word) do
    wrd_length = word |> String.length

    require Integer

    if Integer.is_odd(wrd_length) do
      word |> String.at(div(wrd_length, 2))
    else
      String.at(word, round(wrd_length/2 - 1)) <> String.at(word, round(wrd_length/2))
    end
  end

  @doc """
    Count the monkeys
    Given the number (n), populate an array with all numbers up to and including that number, but excluding zero.

    ## Example

      iex > Practices.count_monkeys(10)
      [1,2,3,4,5,6,7,8,9,10]
  """
  def count_monkeys(n) do
    Enum.map(1..n, fn(x) -> x end)
  end

  @doc """
    Show the length of the words separated by a space to be added at the end of that same word

    ## Example

      iex > Practices.add_length("You will pass. Don't worry")
      ["You 3", "will 4", "pass. 5", "Don't 5", "worry 5"]
  """
  def add_length(string) do
    string |> String.split |> Enum.map(fn(x) -> x <> " " <> (String.length(x) |> Integer.to_string) end)
  end

  @doc """
    Convert string to camelCase

    ## Example

      iex > Practices.to_camel_case("the-stealth-warrior")
      theStealthWarrior
      iex > Practices.to_camel_case("Vincent_Nguyen")
      VincentNguyen
  """
  def to_camel_case(str) do
    [head | tail] = str |> String.split(~r{,|-|_|\s})
    head <> (tail |> Enum.map(fn(x) -> x |> String.capitalize end) |> Enum.join)
  end

  @doc """
    Return a sorted list r in lexicographical order of the strings of a1 which are substrings of strings of a2.

    ## Example

      iex > Practices.lexicographical_sorted_list(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"])
      ["arp", "live", "strong"]
  """
  def lexicographical_sorted_list(a1, a2) do
    a1 |> Enum.filter(fn(x) -> substring?(x, a2) end) |> Enum.sort
  end

  defp substring?(substring, a2) do
    Enum.any?(a2, fn(x) -> String.contains?(x, substring) end)
  end

  @doc """
    Regex to validate a user_name - Any word character (letter, number, underscore) - Length from 4 to 16 chars

    ## Example

      iex > Practices.valid_user_name?("asd43_34$n")
      false
      iex > Practices.valid_user_name?("vincent")
      true
  """
  def valid_user_name?(user_name) do
    user_name |> String.match?(~r/^\w{4,16}$/)
  end

  @doc """
    Is the string uppercase?

    ## Example

      iex > Practices.upper_case?("c")
      false
      iex > Practices.upper_case?("vinCent")
      false
      iex > Practices.upper_case?("HELLO")
      true
  """
  def upper_case?(string) do
    string === string |> String.upcase
  end

  @doc """
    Two to one.
    Take 2 strings s1 and s2 including only letters from ato z. Return a new sorted string, the longest possible, containing distinct letters,

    ## Example

      iex > Practices.longest("xyaabbbccccdefww", "xxxxyyyyabklmopq")
      abcdefklmopqwxy
  """
  def longest(a, b) do
    a <> b |> String.codepoints |> Enum.uniq |> Enum.sort |> Enum.join
  end

  @doc """
    List length
    Caculates the lengh of a list. These functions will use non-tail-recursive form and tail-recursive form to implement

    ## Example

      iex > Practices.length_list_non_tail([1,2,3])
      3
      iex > Practices.length_list_tail([1,2,4,4])
      4
  """
  def length_list_non_tail([]) do
    0
  end

  def length_list_non_tail([_head | tail]) do
    1 + length_list_non_tail(tail)
  end

  def length_list_tail(list) do
    length(0, list)
  end

  # Private functions
  defp length(current_length, []) do
    current_length
  end

  defp length(current_length, [_head | tail]) do
    new_length = current_length + 1
    length(new_length, tail)
  end

  @doc """
    Return a list from two integers

    ## Example

      iex > Practices.range_non_tail(1,5)
      [1,2,3,4,5]
      iex > Practices.range_tail(4, 9)
      [4,5,6,7,8,9]
  """
  def range_non_tail(from, to) when from > to do
    []
  end

  def range_non_tail(from, to) do
    [from | range_non_tail(from + 1, to)]
  end

  def range_tail([], from, to) do
    range([], from, to)
  end

  defp range(current_range, from, to) when from > to do
    current_range
  end

  defp range(current_range, from, to) do
    range([to | current_range], from, to - 1)
  end

  @doc """
    Returns a list of positive numbers from another list

    ## Examples

      iex > Practices.positive_non_tail(["a", -1, 2, 3, 4, -5, 5])
      [2,3,4,5]
      iex > Practices.positive_tail(["a", -1, 2, 3, 4, -5, 5])
      [2,3,4,5]
  """
  def positive_non_tail([]) do
    []
  end

  def positive_non_tail([head | tail]) when is_integer(head) and head > 0 do
    [head | positive_non_tail(tail)]
  end

  def positive_non_tail([_head | tail]) do
    positive_non_tail(tail)
  end

  def positive_tail(list) do
    positive(list, [])
  end

  defp positive([], result) do
    Enum.reverse(result)
  end

  defp positive([head | tail], result) when is_integer(head) and head > 0 do
    positive(tail, [head | result])
  end

  defp positive([_ | tail], result) do
    positive(tail, result)
  end

  @doc """
    Read a file and return a list of numbers, with each number representing the length of the corresponding line from the file

    ## Example

      iex > Practices.lines_length('/path/to/file')
      %{"line 1" => 11, "line 2" => 19}
  """
  def lines_length(file_path) do
    data_of_file(File.read(file_path))
      |> Stream.map(fn(x) -> x |> String.length end)
      |> Stream.with_index
      |> Enum.map(
        fn({line, index}) ->
          {"line #{index + 1}", line}
        end
      )
      |> Map.new
  end

  @doc """
    Return the length of the longest line in a file

    ## Example

      iex > Practices.longest_line_length('path/to/file')
      19
  """
  def longest_line_length(file_path) do
    lines_length(file_path) |> Enum.map(fn({_k, v})-> v end) |> Enum.max
  end

  @doc """
    Return the content of longest line from a file

    ## Example

      iex > Practices.content_longest_line('path/to/file)
      My name is Vincent
  """
  def content_longest_line(file_path) do
    contents = content_length_map(file_path)
    contents[longest_line_length(file_path)]
  end

  @doc """
    Returns a list of number, each number representing the word count in a file

    ## Example

      iex > Practices.words_per_line('path/to/file')
      [2,4]
  """
  def words_per_line(file_path) do
    data_of_file(File.read(file_path))
      |> Enum.map(fn(x)-> x |> String.split |> Enum.count end)
  end

  # Private: Return a list of content of lines from a file
  defp data_of_file(read_file) do
    {:ok, data} = read_file
    data
      |> String.split("\n", trim: true)
  end

  # Private: return a map includes length of line and content from a file
  defp content_length_map(file_path) do
    data_of_file(File.read(file_path))
      |> Enum.map(
        fn(x) ->
          {x |> String.length, x}
        end
      )
      |> Map.new
  end
end
