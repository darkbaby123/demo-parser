defmodule DemoParser.BaseLexerTest do
  use ExUnit.Case, async: true

  alias DemoParser.BaseLexer

  test "whitespace tokens" do
    assert {:ok,
            [
              {:integer, {1, 2}, 1},
              {:+, {1, 4}},
              {:integer, {1, 6}, 2}
            ], _} = BaseLexer.string(~c" 1 + 2 ")
  end

  test "number tokens" do
    assert {:ok, [{:integer, {1, 1}, 0}], _} = BaseLexer.string(~c"00")
    assert {:ok, [{:integer, {1, 1}, 1}], _} = BaseLexer.string(~c"01")
    assert {:ok, [{:integer, {1, 1}, 20}], _} = BaseLexer.string(~c"20")
  end

  test "operator tokens" do
    assert {:ok, [{:+, {1, 1}}], _} = BaseLexer.string(~c"+")
    assert {:ok, [{:-, {1, 1}}], _} = BaseLexer.string(~c"-")
    assert {:ok, [{:*, {1, 1}}], _} = BaseLexer.string(~c"*")
    assert {:ok, [{:/, {1, 1}}], _} = BaseLexer.string(~c"/")
  end
end
