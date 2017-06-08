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

    if str_length |> rem(2) === 0 do
      str_list |> Enum.chunk(2) |> Enum.map(fn(x) -> x |> Enum.join() end)
    else
      str_list |> List.insert_at(-1, "_") |> Enum.chunk(2) |> Enum.map(fn(x) -> x |> Enum.join() end)
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
end
