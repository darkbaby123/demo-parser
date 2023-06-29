defmodule DemoParser.BaseParserTest do
  use ExUnit.Case, async: true

  alias DemoParser.BaseLexer
  alias DemoParser.BaseParser

  test "integer literal" do
    assert {:ok, {:integer, _, 1}} = parse(~c"1")
  end

  test "arithmetic expression" do
    assert {:ok, {:+, _, [{:integer, _, 1}, {:integer, _, 2}]}} = parse(~c"1 + 2")

    assert {:ok,
            {:-, _,
             [
               {:+, _, [{:integer, _, 1}, {:integer, _, 2}]},
               {:integer, _, 3}
             ]}} = parse(~c"1 + 2 - 3")

    assert {
             :ok,
             # (0 - (1 * 2)) + (3 / 4)
             {:+, _,
              [
                # 0 - (1 * 2)
                {:-, _,
                 [
                   {:integer, _, 0},
                   # 1 * 2
                   {:*, _, [{:integer, _, 1}, {:integer, _, 2}]}
                 ]},
                # 3 / 4
                {:/, _, [{:integer, _, 3}, {:integer, _, 4}]}
              ]}
           } = parse(~c"0 - 1 * 2 + 3 / 4")
  end

  defp parse(str) do
    {:ok, tokens, _} = BaseLexer.string(str)
    BaseParser.parse(tokens)
  end
end
