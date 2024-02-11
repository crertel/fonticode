defmodule Fonticode do
  @moduledoc """
  Documentation for `Fonticode`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Fonticode.hello()
      :world

  """
  def hello do
    :world
  end

  @type format_mode ::
          :noop
          | :sans_serif
          | :serif
          | :cursive
          | :blackboard_bold
          | :block
          | :black_filled
          | :bubble
          | :bubble_filled
          | :gothic
          | :small_caps
          | :spaced_out
          | :monospace
          | :bold
          | :superscript
          | :italic

  @type substitution_map :: %{String.t() => String.t()}

  def modes() do
    [
      :noop,
      :sans_serif,
      :serif,
      :cursive,
      :blackboard_bold,
      :block,
      :block_filled,
      :bubble,
      :bubble_filled,
      :gothic,
      :small_caps,
      :spaced_out,
      :monospace,
      :bold,
      :superscript,
      :italic
    ]
  end

  @spec format(String.t(), format_mode) :: String.t()
  def format(text, :noop), do: text
  def format(text, :sans_serif) do
    substitute(text, %{
      "a" => "𝖺", "A" => "𝖠",
      "b" => "𝖻", "B" => "𝖡",
      "c" => "𝖼", "C" => "𝖢",
      "d" => "𝖽", "D" => "𝖣",
      "e" => "𝖾", "E" => "𝖤",
      "f" => "𝖿", "F" => "𝖥",
      "g" => "𝗀", "G" => "𝖦",
      "h" => "𝗁", "H" => "𝖧",
      "i" => "𝗂", "I" => "𝖨",
      "j" => "𝗃", "J" => "𝖩",
      "k" => "𝗄", "K" => "𝖪",
      "l" => "𝗅", "L" => "𝖫",
      "m" => "𝗆", "M" => "𝖬",
      "n" => "𝗇", "N" => "𝖭",
      "o" => "𝗈", "O" => "𝖮",
      "p" => "𝗉", "P" => "𝖯",
      "q" => "𝗊", "Q" => "𝖰",
      "r" => "𝗋", "R" => "𝖱",
      "s" => "𝗌", "S" => "𝖲",
      "t" => "𝗍", "T" => "𝖳",
      "u" => "𝗎", "U" => "𝖴",
      "v" => "𝗏", "V" => "𝖵",
      "w" => "𝗐", "W" => "𝖶",
      "x" => "𝗑", "X" => "𝖷",
      "y" => "𝗒", "Y" => "𝖸",
      "z" => "𝗓", "Z" => "𝖹",
      "1" => "𝟣",
      "2" => "𝟤",
      "3" => "𝟥",
      "4" => "𝟦",
      "5" => "𝟧",
      "6" => "𝟨",
      "7" => "𝟩",
      "8" => "𝟪",
      "9" => "𝟫",
      "0" => "𝟢"
    })
  end
  def format(text, :serif), do: text
  def format(text, :cursive), do: text
  def format(text, :blackboard_bold), do: text
  def format(text, :block), do: text
  def format(text, :block_filled), do: text
  def format(text, :bubble), do: text
  def format(text, :bubble_filled), do: text
  def format(text, :gothic), do: text
  def format(text, :small_caps), do: text
  def format(text, :spaced_out), do: text
  def format(text, :monospace), do: text
  def format(text, :bold), do: text
  def format(text, :superscript), do: text
  def format(text, :italic), do: text

  # taken from:
  # https://elixirforum.com/t/is-there-a-faster-way-to-write-this-code/18486/3
  @spec substitute(String.t(), substitution_map) :: String.t
  def substitute(data, subs) when is_binary(data) and is_map(subs) do
    match_list = :binary.matches(data, Map.keys(subs))
    IO.iodata_to_binary(do_replace(data, match_list, subs, 0))
  end

  @spec do_replace(String.t(), [{non_neg_integer, integer}], substitution_map, non_neg_integer) ::
          [any]
  defp do_replace(h, [], _, n)
      when is_binary(h) and is_integer(n) do
    [:binary.part(h, {n, byte_size(h) - n})]
  end

  defp do_replace(h, [{a, b} | t], subs, n)
      when is_binary(h) and
             is_map(subs) and
             is_list(t) and
             is_integer(a) and
             is_integer(b) and
             is_integer(n) do
    [
      :binary.part(h, {n, a - n}),
      Map.get(subs, :binary.part(h, {a, b}))
      | do_replace(h, t, subs, a + b)
    ]
  end
end
