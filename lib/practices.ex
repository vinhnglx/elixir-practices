defmodule Practices do
  @moduledoc """
  Documentation for Practices.
  """

  @doc """
    Count no of duplicates

    ## Example

        iex > Practices.count_duplicates("abABcdef")
        2 # a,b
        iex > Practices.count_duplicates("impossible")
        2 # i,s
  """
  def count_duplicates(str) do
    # NOTE: _ means this value is not be used
    str
      |> String.downcase()
      |> String.split("", trim: true)
      |> Enum.group_by(fn(x) -> x end)
      |> Enum.count(fn({_key, value}) -> value |> Enum.count() > 1 end)
  end

  @doc """
    String repeat

    ## Example

      iex > Practices.string_repeat(2, "Hello")
      HelloHello
      iex > Practices.string_repeat(0, "Vb")
      ""
  """
  def string_repeat(number, str) do
    if (number === 0 || number < 0) do
      ""
    else
      if number > 0 do
        str |> String.duplicate(number)
      end
    end
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
end
